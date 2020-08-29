APP_NAME="PDF Reducer"

build: 
	pipenv run pyinstaller build-app.spec --noconfirm
	rm -rf ./build
	rm -rf ./dist/$(APP_NAME)

package: 
	./build-dmg.sh

clean: 
	rm -f *.dmg
	rm -rf ./dist
	rm -rf ./build

