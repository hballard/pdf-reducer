import os
import shutil
import subprocess

from enum import Enum
from PySide2.QtCore import QObject, Slot, Signal
from tempfile import gettempdir
from typing import Optional

from utilities import get_current_dir


class CompressionQuality(Enum):
    PREPRESS = "/prepress"
    PRINTER = "/printer"
    EBOOK = "/ebook"
    SCREEN = "/screen"


class PDFController(QObject):
    compressionResult = Signal("QVariantList")
    temp_output_file_path: Optional[str]

    def __init__(self):
        super().__init__()

    @staticmethod
    def is_pdf_file(input_file_path: str) -> bool:
        return input_file_path.split(".")[-1].lower() == "pdf"

    @staticmethod
    def parse_compression_quality(quality_arg: str) -> CompressionQuality:
        quality_arg_dict = {
            "HD (300 PPI)": CompressionQuality.PREPRESS,
            "Print (300 PPI)": CompressionQuality.PRINTER,
            "Presentation (150 PPI)": CompressionQuality.EBOOK,
            "Email (72 PPI)": CompressionQuality.SCREEN,
        }
        return quality_arg_dict[quality_arg]

    @Slot(str, str)
    def compress_file(self, input_file_path: str, quality: str) -> None:

        input_file_path = input_file_path.replace("file://", "")

        if not self.is_pdf_file(input_file_path):
            error_message = "Error: input file is not a PDF"
            self.compressionResult.emit(("error", error_message))
            return

        compression_quality = self.parse_compression_quality(quality)

        binary_path = os.path.join(get_current_dir(), "lib", "gs")

        self.temp_output_file_path = os.path.join(
            gettempdir(), os.path.basename(input_file_path)
        )

        subprocess.run(
            [
                f"{binary_path}",
                "-sDEVICE=pdfwrite",
                "-dCompatibilityLevel=1.4",
                f"-dPDFSETTINGS={compression_quality.value}",
                "-dNOPAUSE",
                "-dQUIET",
                "-dBATCH",
                f"-sOutputFile={self.temp_output_file_path}",
                input_file_path,
            ]
        )

        initial_size = os.path.getsize(input_file_path)
        final_size = os.path.getsize(self.temp_output_file_path)
        percent_reduction = (initial_size - final_size) / initial_size
        output_message = (
            f"File reduced from {(initial_size / 1000000):.4f}MB"
            f" to {(final_size / 1000000):.4f}MB ({percent_reduction:.1%})"
        )

        self.compressionResult.emit(("result", output_message))

    @Slot(str)
    def copy_file(self, output_file_path: str) -> None:
        output_file_path = output_file_path.replace("file://", "")
        try:
            if self.temp_output_file_path:
                new_base_file_path = os.path.basename(
                    self.temp_output_file_path
                ).split(".")[0]
                new_output_file_path = os.path.join(
                    output_file_path, f"{new_base_file_path}-compressed.pdf"
                )
                shutil.copyfile(
                    self.temp_output_file_path, new_output_file_path
                )
        except OSError as e:
            self.error_message = str(e)
