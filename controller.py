import os
import shutil
import subprocess

from enum import Enum
from typing import Optional
from tempfile import gettempdir
from PySide2.QtCore import Property, QObject, Signal, Slot

from utilities import get_current_dir


class CompressionQuality(Enum):
    DEFAULT = "/default"
    PREPRESS = "/prepress"
    PRINTER = "/printer"
    EBOOK = "/ebook"
    SCREEN = "/screen"


class PDFController(QObject):
    error_message: Optional[str]
    temp_output_file_path: Optional[str]
    output_message: Optional[str]

    def __init__(self):
        super().__init__()

    @staticmethod
    def is_pdf_file(input_file_path) -> bool:
        return input_file_path.split(".")[-1].lower() == "pdf"

    def compress_file(
        self, input_file_path, quality=CompressionQuality.PRINTER
    ) -> None:

        if not self.is_pdf_file(input_file_path):
            self.error_message = "Error: input file is not a PDF"
            return

        binary_path = os.path.join(get_current_dir(), "lib", "gs")

        initial_size = os.path.getsize(input_file_path)

        self.temp_output_file_path = os.path.join(
            gettempdir(), os.path.basename(input_file_path)
        )

        subprocess.run(
            [
                f"{binary_path}",
                "-sDEVICE=pdfwrite",
                "-dCompatibilityLevel=1.4",
                f"-dPDFSETTINGS={quality}",
                "-dNOPAUSE",
                "-dQUIET",
                "-dBATCH",
                f"-sOutputFile={self.temp_output_file_path}",
                input_file_path,
            ]
        )

        final_size = os.path.getsize(self.temp_output_file_path)
        ratio = 1 - (final_size / initial_size)
        self.output_message = (
            f"File reduced from {(initial_size / 1000000):.1f}MB"
            f"to {(final_size / 1000000):.1f}MB ({ratio:.0%})"
        )

    def copy_file(self, output_file_path) -> None:
        try:
            if self.temp_output_file_path:
                shutil.copyfile(
                    self.temp_output_file_path,
                    os.path.join(
                        output_file_path,
                        os.path.basename(self.temp_output_file_path),
                    ),
                )
        except OSError as e:
            self.error_message = str(e)
