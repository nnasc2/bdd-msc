#!/bin/bash

# Configurações
DOCS_DIR="./docs"
ENGINE="gherkin_engine.py"

echo "Iniciando Processo"

if [ ! -d "$DOCS_DIR" ]; then
    echo "Erro: Diretório $DOCS_DIR não encontrado."
    exit 1
fi

for file in "$DOCS_DIR"/*.txt; do
    echo "Lendo $file"
    
        python3 "$ENGINE" "$file"
    
        if [ $? -ne 0 ]; then
        echo -e "erro em $file"
        exit 1
    fi
done

echo "finalizado"