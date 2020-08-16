import os
import sys

from PySide2.QtQml import QQmlApplicationEngine
from PySide2.QtCore import QUrl
from PySide2.QtGui import QGuiApplication

from utilities import get_current_dir
# from controller import CalculatorController

current_dir = get_current_dir()

os.environ["QT_QUICK_CONTROLS_CONF"] = os.path.join(
    current_dir, "view", "qtquickcontrols2.conf"
)
os.environ["QT_AUTO_SCREEN_SCALE_FACTOR"] = "1"

app = QGuiApplication(sys.argv)
engine = QQmlApplicationEngine()

import_path = os.path.join(current_dir, "view", "imports")
engine.addImportPath(import_path)

#  controller = CalculatorController()
#  view.rootContext().setContextProperty("controller", controller)

filename = os.path.join(current_dir, "view", "Main.qml")
url = QUrl(filename)
engine.load(url)

if not engine.rootObjects():
    sys.exit(-1)

sys.exit(app.exec_())
