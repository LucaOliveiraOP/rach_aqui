import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:rach_aqui_project/theme.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class Onbording extends StatefulWidget {
  const Onbording({super.key});

  @override
  State<Onbording> createState() => _OnbordingState();
}

class _OnbordingState extends State<Onbording> {
  final PageController _controller = PageController();
  late double _paginaAtual;
  bool isLastPage = false;
  String _titulo = 'Seja Bem vindo(a)!';
  String _texto =
      'Com o RachAqui, divida a conta com os amigos sem estresse. Calcule facilmente o valor que cada um deve pagar.';

  @override
  void initState() {
    super.initState();
    _paginaAtual = _controller.initialPage.toDouble();
    _controller.addListener(_onPageChanged);
    atualizarTextoDoCampo();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _onPageChanged() {
    setState(() {
      _paginaAtual = _controller.page!;
      atualizarTextoDoCampo();
      atualizarTextoDoTitulo();
    });
  }

  void atualizarTextoDoTitulo() {
    if (_paginaAtual == 0) {
      setState(() {
        _titulo = 'Seja Bem Vindo(a)!';
      });
    } else if (_paginaAtual == 1) {
      setState(() {
        _titulo = 'Pedido Coletivo';
      });
    } else if (_paginaAtual == 2) {
      setState(() {
        _titulo = 'Divisão Automática';
      });
    } else {
      setState(() {
        _titulo = '';
      });
    }
  }

  void atualizarTextoDoCampo() {
    if (_paginaAtual == 0) {
      setState(() {
        _texto =
            'Com o RachAqui, divida a conta com os amigos sem estresse. Calcule facilmente o valor que cada um deve pagar.';
      });
    } else if (_paginaAtual == 1) {
      setState(() {
        _texto =
            'Faça pedidos compartilhados em tempo real com amigos. Adicione e personalize itens para garantir a satisfação de todos.';
      });
    } else if (_paginaAtual == 2) {
      setState(() {
        _texto =
            'Calcule automaticamente a parte de cada pessoa na conta. Elimine conflitos e discussões sobre a divisão da conta.';
      });
    } else {
      setState(() {
        _texto = '';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.only(bottom: 0),
        child: PageView(
          controller: _controller,
          children: [
            Stack(
              children: [
                Container(
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/images/fundo1.png'),
                      fit: BoxFit.cover,
                    ),
                  ),
                  constraints: const BoxConstraints.expand(),
                  child: Padding(
                      padding: const EdgeInsets.only(bottom: 200.0),
                      child: SvgPicture.asset('assets/images/Group1.svg')),
                )
              ],
            ),
            Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/fundo2.png'),
                  fit: BoxFit.cover,
                ),
              ),
              constraints: const BoxConstraints.expand(),
              child: Padding(
                  padding: const EdgeInsets.only(bottom: 190.0),
                  child: SvgPicture.asset('assets/images/Group2.svg')),
            ),
            Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/fundo3.png'),
                  fit: BoxFit.cover,
                ),
              ),
              constraints: const BoxConstraints.expand(),
              child: Padding(
                  padding: const EdgeInsets.only(bottom: 200.0),
                  child: SvgPicture.asset('assets/images/Group3.svg')),
            )
          ],
        ),
      ),
      bottomSheet: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        height: 330,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const SizedBox(
                width: 10,
              ),
              SizedBox(
                height: 150,
                width: 400,
                child: Column(
                  children: [
                    Text(
                      _titulo,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontFamily: 'Montserrat-Bold',
                        fontWeight: FontWeight.w700,
                        fontSize: 25,
                        color: CustomColors.seventhColor,
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Text(
                      _texto,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontFamily: 'Montserrat-SemiBold',
                        fontWeight: FontWeight.w300,
                        fontSize: 18,
                        color: CustomColors.eighthColor,
                      ),
                    ),
                  ],
                ),
              ),
              SmoothPageIndicator(
                controller: _controller,
                count: 3,
                effect: const ExpandingDotsEffect(
                    dotHeight: 7,
                    dotWidth: 8,
                    activeDotColor: CustomColors.sixthColor),
              ),
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                TextButton(
                  onPressed: () => _controller.jumpToPage(2),
                  child: const Text(
                    'Pular',
                    style: TextStyle(
                      fontFamily: 'Montserrat-Thin',
                      fontWeight: FontWeight.w200,
                      fontSize: 15,
                      color: CustomColors.seventhColor,
                    ),
                  ),
                ),
                TextButton(
                  onPressed: () => _controller.nextPage(
                      duration: const Duration(milliseconds: 400),
                      curve: Curves.easeInOut),
                  child: SvgPicture.asset('assets/images/onbordingseta.svg'),
                ),
              ]),
              const SizedBox(
                width: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
