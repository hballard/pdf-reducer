import os
import sys


def get_current_dir() -> str:
    if getattr(sys, "frozen", False):
        current_dir = sys._MEIPASS
    else:
        current_dir = os.path.dirname(os.path.abspath(__file__))
    return current_dir
