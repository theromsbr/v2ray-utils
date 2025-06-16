#!/bin/bash

clear
echo "========================================================="
echo "  Configuração de V2Ray da Central da CDN @centraldacdn  "
echo "========================================================="
echo ""

# Solicita o ID da vaga
read -p "Digite o número do seu ID do Backend (ex: para app5, digite apenas 5): " vaga

# Verifica se é um número válido
if [[ ! "$vaga" =~ ^[0-9]+$ ]]; then
    echo ""
    echo "Erro: Você deve inserir um número válido!"
    exit 1
fi

# Altera o caminho no arquivo de configuração
echo ""
echo "Alterando configuração do V2Ray..."
sed -i "s|\"path\": \"/ws/\"|\"path\": \"/ws$vaga/\"|g" /etc/v2ray/config.json

# Reinicia o serviço
echo "Reiniciando o serviço V2Ray..."
systemctl restart v2ray

# Mensagem de sucesso
echo ""
echo "Configuração aplicada com sucesso!"
echo "Novo path: /ws$vaga/"
