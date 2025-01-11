# Installing Font in terminal
1. Download NerdFonts
2. Extract
3. Put the font in usr/.local/share/fonts
4. Rebuild font cache by running fc-cache -f -v

## Example
```bash
wget -P ~/.local/share/fonts/ https://github.com/ryanoasis/nerd-fonts/releases/download/v3.3.0/RobotoMono.zip \
&& cd ~/.local/share/fonts/ \
&& unzip RobotoMono.zip \
&& rm RobotoMono.zip \
&& fc-cache -fv
```
