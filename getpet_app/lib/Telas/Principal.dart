import 'package:flutter/material.dart';
import 'package:getpet/Widgets/FazerChamado.dart';
import 'package:getpet/Widgets/VerChamados.dart';
import 'package:getpet/Widgets/VerPerfil.dart';
import 'package:getpet/Widgets/VerPerfilM.dart';
import 'package:getpet/models/user_model.dart';
import 'package:scoped_model/scoped_model.dart';

class Principal extends StatefulWidget {
  const Principal({Key? key}) : super(key: key);

  @override
  State<Principal> createState() => _PrincipalState();
}

class _PrincipalState extends State<Principal> {
  int currentIndex = 0;
  var pagesServidor = const [
    VerChamados(),
    FazerChamado(),
    VerPerfilM(),
  ];
  var pagesCliente = const [
    FazerChamado(),
    VerPerfil(),
  ];
  var _appPageController = PageController();

  setBottomBarIndex(index) {
    setState(() {
      currentIndex = index;
    });
    _appPageController.animateToPage(index,
        duration: Duration(milliseconds: 500), curve: Curves.ease);
  }
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return ScopedModelDescendant<UserModel>(
      builder: (context, child, model){
        return Scaffold(
          body: SafeArea(
            child: PageView(
              scrollDirection: Axis.horizontal,
              onPageChanged: (index) {
                setState(() {
                  currentIndex = index;
                });
              },
              controller: _appPageController,
              children: model.servidor ? pagesServidor : pagesCliente,

            ),
          ),
            bottomNavigationBar: Container(
              width: size.width,
              height: 80,
              child: Stack(
                //overflow: Overflow.visible,
                children: [
                  Container(
                    width: size.width,
                    height: 80,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: model.servidor ? [
                      IconButton(
                          icon: Icon(
                            Icons.list_rounded,
                            color: currentIndex == 0
                                ? Colors.green[700]
                                : Colors.grey.shade400,
                          ),
                          onPressed: () {
                            setBottomBarIndex(0);
                          }),
                        IconButton(
                            icon: Icon(
                              Icons.add_circle_rounded,
                              color: currentIndex == 1
                                  ? Colors.green[700]
                                  : Colors.grey.shade400,
                            ),
                            onPressed: () {
                              setBottomBarIndex(1);
                            }),
                      IconButton(
                          icon: Icon(
                            Icons.person_rounded,
                            color: currentIndex == 2
                                ? Colors.green[700]
                                : Colors.grey.shade400,
                          ),
                          onPressed: () {
                            setBottomBarIndex(2);
                          }),
                      ] : [
                        IconButton(
                            icon: Icon(
                              Icons.add_circle_rounded,
                              color: currentIndex == 0
                                  ? Colors.green[700]
                                  : Colors.grey.shade400,
                            ),
                            onPressed: () {
                              setBottomBarIndex(0);
                            }),
                        IconButton(
                            icon: Icon(
                              Icons.person_rounded,
                              color: currentIndex == 1
                                  ? Colors.green[700]
                                  : Colors.grey.shade400,
                            ),
                            onPressed: () {
                              setBottomBarIndex(1);
                            }),
                      ],
                    ),
                  )
                ],
              ),
            )
        );
      }
    );
  }
  void _onTappedBar(int value) {
    setState(() {
      currentIndex = value;
    });
    _appPageController.jumpToPage(value);
  }
}
