# tripper

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://flutter.dev/docs/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://flutter.dev/docs/cookbook)

For help getting started with Flutter, view our
[online documentation](https://flutter.dev/docs), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

```

class Usuario {
    int codUsuario;
    String nome;
    String sobrenome;
    String email;
    bool verificado;
    DateTime nascimento;
    Moeda moedaPadrao;
    // Localizacao localizacao; 
    // List<Viagem> Viagens;
}

class Viagem {
    int codViagem;
    String nome;
    DateTime dataInicio;
    DateTime dataFim;
    Destino destino;
    int codUsuario;
    List<int> Acompanhantes; // List<codUsuario>
    List<ViagemItem> Itens;
    // List<Reserva> Reservas;
}

class ViagemItem {
    // ViagemItemAtracao atracao;
    String nome;
    ViagemItemAtracaoEndereco endereco;
    DateTime data;
    DateTime horaInicio;
    DateTime horaFim;
    String duracao;
    Money valor;
    Transporte transporte; // ????
    String anotação;
}

// class ViagemItemAtracao {
//     int codViagemAtracao;
// }

class Atracao {
    int codAtracao;
    string nome;
    // Tudo que tiver no Google Places
}

class Transporte {
    TipoTransporte tipo; // A pé, Carro, Metrô, Avião
    String duracao;
    Money valor;
}

class Money {
    Decimal valor;
    String codigoMoeda; //(USD, CAD, AUD)
}

class Cotacao {

}

// Atualizar as cotações do dia a noite

```

TODO: COlocar isso na playstore: <a href="https://www.freepik.com/vectors/travel">Travel vector created by stories - www.freepik.com</a>