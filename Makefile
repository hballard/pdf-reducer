APP_NAME="PDF Reducer"

build: 
	@echo "Building app...\n"
	pipenv run pyinstaller build-app.spec --noconfirm
	@echo ""
	rm -rf ./build
	rm -rf ./dist/$(APP_NAME)
	@echo "\n***Build complete.***"

package: 
	@echo "Packaging app into dmg...\n"
	./build-dmg.sh
	@echo "\n***Package complete.***"

clean: 
	@echo "Cleaning up build and dist files...\n"
	rm -f *.dmg
	rm -rf ./dist
	rm -rf ./build
	@echo "\n***Files deleted.***"

