# -*- mode: python ; coding: utf-8 -*-
import os


block_cipher = None

added_files = [
    ("view", "view"),
    ("/usr/local/Cellar/ghostscript/9.52/bin", "vendor/ghostscript/bin"),
    ("/usr/local/Cellar/ghostscript/9.52/lib", "vendor/ghostscript/lib")
]

included_binaries = [
    (
        "/users/heath/.local/share/virtualenvs/pdf-reducer-rdogquat/lib/python3.8/site-packages/shiboken2/libshiboken2.abi3.5.15.dylib",
        "shiboken2",
    )
]

excluded_binaries = [
    "QtWebEngineCore",
    "QtXmlPatterns",
    "QtVirtualKeyboard",
    "QtLocation",
    "QtCharts",
    "QtDataVisualization",
    "QtBluetooth",
    "QtRemoteObjects",
    "QtQuick3DRuntimeRender",
    "QtPositioning",
    "QtQuick3DRender",
    "QtQuick3D",
    "QtWebEngine",
    "QtTest",
    "QtSensors",
    "QtSql",
    "QtBodymovin",
    "QtNfc",
    "QtWebChannel",
    "QtQuick3DAssetImport",
    "QtPositioningQuick",
    "QtGamepad",
    "QtWebView",
    "QtPurchasing",
    "QtQuick3DUtils",
    "QtMultimedia",
    #  "QtQuickTemplates2",
    "QtQuickParticles",
    "QtScxml",
]

a = Analysis(
    ["main.py"],
    pathex=[],
    binaries=included_binaries,
    datas=added_files,
    hiddenimports=[],
    hookspath=[],
    runtime_hooks=[],
    #  excludes=["FixTk", "tcl", "tk", "_tkinter", "tkinter", "Tkinter"],
    excludes=[],
    win_no_prefer_redirects=False,
    win_private_assemblies=False,
    cipher=block_cipher,
    noarchive=False,
)

a.binaries = [x for x in a.binaries if not x[0].startswith("Qt3D")]
a.binaries = TOC([x for x in a.binaries if x[0] not in excluded_binaries])

pyz = PYZ(a.pure, a.zipped_data, cipher=block_cipher)
exe = EXE(
    pyz,
    a.scripts,
    [],
    exclude_binaries=True,
    name="PDF Reducer",
    debug=False,
    bootloader_ignore_signals=False,
    strip=False,
    upx=True,
    console=False,
)
coll = COLLECT(
    exe,
    a.binaries,
    a.zipfiles,
    a.datas,
    strip=False,
    upx=True,
    upx_exclude=[],
    name="PDF Reducer",
)
app = BUNDLE(
    coll,
    name="PDF Reducer.app",
    info_plist={"NSHighResolutionCapable": "True"},
    icon=os.path.join("images", "program_icon.icns"),
    bundle_identifier=None,
)
