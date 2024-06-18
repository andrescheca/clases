.PHONY: runvscode

runvscode:
	hugo serve --bind 0.0.0.0 -b https://1313.vscode.synology.cdv.moran.com.ec --appendPort=false
