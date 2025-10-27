#!/bin/bash

echo "🚀 Iniciando build de otimização..."

# Minificar CSS
echo "📝 Minificando CSS..."
for css_file in assets/css/*.css; do
    if [[ $css_file != *.min.css ]]; then
        filename=$(basename "$css_file" .css)
        cleancss "$css_file" -o "assets/css/${filename}.min.css"
        echo "✓ Minificado: $css_file → assets/css/${filename}.min.css"
    fi
done

# Minificar JS
echo "📝 Minificando JavaScript..."
for js_file in assets/js/*.js; do
    if [[ $js_file != *.min.js ]]; then
        filename=$(basename "$js_file" .js)
        uglifyjs "$js_file" -o "assets/js/${filename}.min.js"
        echo "✓ Minificado: $js_file → assets/js/${filename}.min.js"
    fi
done

echo "✅ Build concluído!"
