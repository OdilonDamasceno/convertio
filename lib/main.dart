import 'package:flutter/material.dart';
import 'app/app.dart';

// Aparentemente algumas vezes a API não retorna os dados de forma adequada
// Então é necessário dar um hot restart
// Ou após uma série de debugs, reparou-se que algumas classes [Money]
// não estavam sendo inicializadas
void main(List<String> args) => runApp(ConvertIO());
