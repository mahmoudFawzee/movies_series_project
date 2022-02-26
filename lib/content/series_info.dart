import 'package:netflex_project/content/series.dart';

const String _lacasedepapelcover1 =
    'https://i.egycdn.com/pic/WmFwZndlY21UbW1ITmptbXZjRWNtbVBtZENqbWJtVGc.jpg';
const String _lacasedepapelcover2 =
    'https://i.egycdn.com/pic/WmFwZndlY21UbW1tbW1tb2N2UmN2VWZOWW1tdnhtZw.jpg';
const String _lacasedepapelcover3 =
    'https://i.egycdn.com/pic/WmFwZndlY21MTlRibUVtb1JjdmN2Y21ibXZ2Y212bXhq.jpg';
const String _lacasedepapelcover4 =
    'https://i.egycdn.com/pic/WmFwZndlY21ZcG12dE5vUmNtdm1JeGNObW1oVG0.jpg';
const String _lacasedepapelcover5 =
    'https://i.egycdn.com/pic/WmFwZndlY21ITm9ObW1qbUVFY2FtVEVtRXdUWVRi.jpg';

const String _breakingBadCover1 =
    'https://static.wikia.nocookie.net/breakingbad/images/5/58/BB_S1_poster.jpg/revision/latest/scale-to-width-down/340?cb=20170524134743';

List<MySerie> myAllSeries = [
  MySerie(
    id: 0,
    name: 'la case de papel',
    type: ["A","R"],
    cover: _lacasedepapelcover1,
    hint:
        'A mysterious man nicknamed "The Professor" prepares for the biggest heist ever accomplished, and to do so, he recruits 8 people who have nothing to lose. The idea is to break into the Spanish mint and print 2.4 billion euros and they need to achieve that to stay there 11 days and deal with 67 hostages and the elite of the Spanish police force. During the execution of the operation, a genius detective named Raquel comes and tries to stop this robbery, which is the largest of its kind in the Kingdom of Spain, so a game of adventure and intelligence begins between the professor and the detective Raquel.',
  ),
  MySerie(
      id: 1,
      name: 'breaking bad',
      type: ["A","D",],
      cover: _breakingBadCover1,
      hint:
          'After discovering that he has lung cancer, a chemistry teacher hires Jesse Pinkman, his former science student, to help him cook meth and sell it in New Mexico, and Walt undergoes many changes in his new personality.')
];

List<ASerie> allSeries = const [
  ASerie(name: 'la Case De Papel',
  cover: _lacasedepapelcover1,
   seasons: [
    Season(
        name: 'la case de papel ',
        cover: _lacasedepapelcover1,
        season: 1,
        url: 'https://youtu.be/_InqQJRqGW4',
        eposids: [
          EposidInfo(numberOfEposid: 1,),
          EposidInfo(numberOfEposid: 2, ),
          EposidInfo(numberOfEposid: 3, ),
          EposidInfo(numberOfEposid: 4,),
          EposidInfo(numberOfEposid: 5, ),
          EposidInfo(numberOfEposid: 6, ),
          EposidInfo(numberOfEposid: 7, ),
          EposidInfo(numberOfEposid: 8, ),
        //  EposidInfo(numberOfEposid: 9, ),
        ]),
    Season(
        name: 'la case de papel ',
        cover: _lacasedepapelcover2,
        season: 2,
        url: 'https://youtu.be/ZAXA1DV4dtI',
        eposids: [
          EposidInfo(numberOfEposid: 1,),
          EposidInfo(numberOfEposid: 2, ),
          EposidInfo(numberOfEposid: 3, ),
          EposidInfo(numberOfEposid: 4,),
          EposidInfo(numberOfEposid: 5, ),
          EposidInfo(numberOfEposid: 6, ),
          EposidInfo(numberOfEposid: 7, ),
          EposidInfo(numberOfEposid: 8, ),
        //  EposidInfo(numberOfEposid: 9, ),
        ]),
    Season(
        name: 'la case de papel ',
        cover:
            _lacasedepapelcover3,
        season: 3,
        url: 'https://youtu.be/TFJwUwnShnA',
        eposids: [
          EposidInfo(numberOfEposid: 1,),
          EposidInfo(numberOfEposid: 2, ),
          EposidInfo(numberOfEposid: 3, ),
          EposidInfo(numberOfEposid: 4,),
          EposidInfo(numberOfEposid: 5, ),
          EposidInfo(numberOfEposid: 6, ),
          EposidInfo(numberOfEposid: 7, ),
          EposidInfo(numberOfEposid: 8, ),
          EposidInfo(numberOfEposid: 9, ),
        ]),
    Season(
        name: 'la case de papel ',
        cover:
            _lacasedepapelcover4,
        season: 4,
        url: 'https://youtu.be/p_PJbmrX4uk',
        eposids: [
          EposidInfo(numberOfEposid: 1,),
          EposidInfo(numberOfEposid: 2, ),
          EposidInfo(numberOfEposid: 3, ),
          EposidInfo(numberOfEposid: 4,),
          EposidInfo(numberOfEposid: 5, ),
          EposidInfo(numberOfEposid: 6, ),
          EposidInfo(numberOfEposid: 7, ),
          EposidInfo(numberOfEposid: 8, ),
          EposidInfo(numberOfEposid: 9, ),
        ]),
    Season(
        name: 'la case de papel ',
        cover:
           _lacasedepapelcover5,
        season: 5,
        url: 'https://youtu.be/8moHEB-ierQ',
        eposids: [
          EposidInfo(numberOfEposid: 1,),
          EposidInfo(numberOfEposid: 2, ),
          EposidInfo(numberOfEposid: 3, ),
          EposidInfo(numberOfEposid: 4,),
          EposidInfo(numberOfEposid: 5, ),
          EposidInfo(numberOfEposid: 6, ),
          EposidInfo(numberOfEposid: 7, ),
          EposidInfo(numberOfEposid: 8, ),
          EposidInfo(numberOfEposid: 9, ),
        ]),
  ]),

  ASerie(name: 'breaking bad',
  cover: _breakingBadCover1,
   seasons: [
    Season(
        name: 'breaking bad',
        cover: _breakingBadCover1,
        season: 1,
        url: 'https://youtu.be/HhesaQXLuRY',
        eposids: [
          EposidInfo(numberOfEposid: 1,),
          EposidInfo(numberOfEposid: 2, ),
          EposidInfo(numberOfEposid: 3, ),
          EposidInfo(numberOfEposid: 4,),
          EposidInfo(numberOfEposid: 5,),
          EposidInfo(numberOfEposid: 6, ),
          EposidInfo(numberOfEposid: 7,),
          EposidInfo(numberOfEposid: 8, ),
          EposidInfo(numberOfEposid: 9, ),
        ]),
        Season(
        name: 'breaking bad',
        cover: _breakingBadCover1,
        season: 2,
        url: 'https://youtu.be/I-8914DuyhY',
        eposids: [
          EposidInfo(numberOfEposid: 1,),
          EposidInfo(numberOfEposid: 2, ),
          EposidInfo(numberOfEposid: 3, ),
          EposidInfo(numberOfEposid: 4,),
          EposidInfo(numberOfEposid: 5,),
          EposidInfo(numberOfEposid: 6, ),
          EposidInfo(numberOfEposid: 7,),
          EposidInfo(numberOfEposid: 8, ),
          EposidInfo(numberOfEposid: 9, ),
        ]),
        Season(
        name: 'breaking bad',
        cover: _breakingBadCover1,
        season: 3,
        url: 'https://youtu.be/1JLUn2DFW4w',
        eposids: [
          EposidInfo(numberOfEposid: 1,),
          EposidInfo(numberOfEposid: 2, ),
          EposidInfo(numberOfEposid: 3, ),
          EposidInfo(numberOfEposid: 4,),
          EposidInfo(numberOfEposid: 5,),
          EposidInfo(numberOfEposid: 6, ),
          EposidInfo(numberOfEposid: 7,),
          EposidInfo(numberOfEposid: 8, ),
        //  EposidInfo(numberOfEposid: 9, ),
        ]),
        
         ])
];