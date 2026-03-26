#!/usr/bin/env bash

set -e

echo "🔧 Installing MacGNOME GTK4 theme..."

GTK_DIR="$HOME/.config/gtk-4.0"
CSS_FILE="Macgnome.css"
TARGET_FILE="$GTK_DIR/gtk.css"

# Criar diretório se não existir
mkdir -p "$GTK_DIR"

# Backup se já existir gtk.css
if [ -f "$TARGET_FILE" ]; then
    echo "📦 Backing up existing gtk.css..."
    mv "$TARGET_FILE" "$GTK_DIR/gtk.css.bak"
fi

# Copiar CSS
echo "📁 Copying Macgnome.css..."
cp "$CSS_FILE" "$GTK_DIR/"

# Criar symlink como gtk.css
echo "🔗 Linking as gtk.css..."
ln -sf "$GTK_DIR/$CSS_FILE" "$TARGET_FILE"

echo "✅ Installed successfully!"

echo ""
echo "⚠️ IMPORTANT:"
echo "- Works only on GTK4 apps"
echo "- You may need to restart GNOME session (logout/login)"
