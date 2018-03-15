# Projeto WEB - Blog
Aplicação Web de um Blog para Seleção de Estágio na Tracking Trade
![Blog Docs](/Docs/Blog.png)

[![GitHub issues](https://img.shields.io/github/issues/mateusc42/Projeto-Web.svg)](https://github.com/mateusc42/Projeto-Web/issues)
[![GitHub forks](https://img.shields.io/github/forks/mateusc42/Projeto-Web.svg)](https://github.com/mateusc42/Projeto-Web/network)
[![GitHub license](https://img.shields.io/github/license/mateusc42/Projeto-Web.svg)](https://github.com/mateusc42/Projeto-Web)
[![GitHub release](https://img.shields.io/github/release/mateusc42/Projeto-Web.svg)](https://github.com/mateusc42/Projeto-Web/releases)

Versão 1.0 do projeto web de um blog.

## Instalação

Rode os Seguintes Comandos:

	bundle install
	rake db:create
	rake db:migrate

Caso Queira Criar Alguns Usuários e Posts:

	rake db:seed

Para rodar o projeto:

	rails s

## Gem's Utilizadas no Projeto

	Criação de usuários comuns e administradores
	gem 'devise'

	Ajuda na criação de formulários
	gem 'simple_form'

	Renderização do navegadores de forma padronizada
	gem 'normalize-rails'

	Biblioteca de Anexos
	gem 'paperclip'

	Soft Delete 
	gem 'paranoia'

	Biblioteca de Paginação
	gem 'will_paginate'

	Editor de Texto
	gem 'tinymce-rails'

	Biblioteca de Autorização
	gem 'cancancan'

> **Nota:** Esse projeto foi desenvolvido em ambiente linux, caso ocorra alguma incompatibilidade.
