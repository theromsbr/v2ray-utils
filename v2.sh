#!/bin/bash

clear
echo "========================================================="
echo "  Configuração de V2Ray da Central da CDN @centraldacdn  "
echo "========================================================="
echo ""

echo "🔔 Atenção:"
echo "Certifique-se de que o V2Ray está instalado com as seguintes configurações:"
echo " - Porta interna: 8080"
echo " - Porta externa: 443"
echo " - NGINX ativado na instalação do v2ray"
echo ""

read -p "Digite o número do seu ID do Backend (ex: para app5, digite apenas 5): " vaga

if [[ ! "$vaga" =~ ^[0-9]+$ ]]; then
    echo ""
    echo "Erro: Você deve inserir um número válido!"
    exit 1
fi

echo ""
echo "Alterando configuração do V2Ray..."
sed -i "s|\"path\": \"/ws/\"|\"path\": \"/ws$vaga/\"|g" /etc/v2ray/config.json

echo "Reiniciando o serviço V2Ray..."
systemctl restart v2ray

echo ""
echo "Configuração aplicada com sucesso!"
echo "  Novo path configurado: /ws$vaga/"
