create-dmg \
  --volname "PDF Reducer" \
  --volicon "./images/drive_icon.icns" \
  --background "./images/installer_background_image.png" \
  --window-pos 200 120 \
  --window-size 455 300 \
  --icon-size 100 \
  --icon "PDF Reducer.app" 100 150 \
  --hide-extension "PDF Reducer.app" \
  --app-drop-link 350 150 \
  "PDFReducer.dmg" \
  "./dist/"
