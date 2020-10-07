class HomeData {
  static bool name = false;
  static String ply1 = "Player1";
  static String ply2 = "Player2";
  static bool gameOver = false;
  static bool autoFill = true;
  static bool switchPlayers = true;
  static bool once = true;
  static bool player = true;
  static int ab = 1;
  static int ab2 = 1;
  static int l = 0;
  static int d1 = 0;
  static int d2 = 0;
  static int ln = 0;
  static int d1n = 0;
  static int d2n = 0;
  static bool le = false;
  static bool restart = false;
  static bool ohTune = true;

  static List<String> nandandis2 = [
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    ''
  ];

  static List<String> display = [
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    ''
  ];

  static check(int index,List<String> s,String d){
    checkVertical(index,s,d);
    checkHorizontal(index,s,d);
    if(d == "d"){
      if (display[0] == display[6] && display[0] == display[12] &&
          display[0] == display[18] && display[0] == display[24] &&
          display[0] != ""){
        d1++;
        if(d1 == 1){
          l++;
        }
      }

      if (display[4] == display[8] && display[4] == display[12] &&
          display[4] == display[16] && display[4] == display[20] &&
          display[4] != ""){
        d2++;
        if(d2 == 1){
          l++;
        }
      }
    }else{
      if (nandandis2[0] == nandandis2[6] && nandandis2[0] == nandandis2[12] &&
          nandandis2[0] == nandandis2[18] && nandandis2[0] == nandandis2[24] &&
          nandandis2[0] != ''){
        d1n++;
        if(d1n == 1){
          ln++;
        }
      }

      if (nandandis2[4] == nandandis2[8] && nandandis2[4] == nandandis2[12] &&
          nandandis2[4] == nandandis2[16] && nandandis2[4] == nandandis2[20] &&
          nandandis2[4] != ''){
        d2n++;
        if(d2n == 1){
          ln++;
        }
      }
    }
  }

  static checkVertical(int index, List<String> s,String d){
    int a = index;
    int b = index;
    int v = 0;
    while(a-5 >= 0){
      if(s[a-5] == "X"){
        v++;
      }
      a -= 5;
    }
    while(b+5 <= 24){
      if(s[b+5] == "X"){
        v++;
      }
      b += 5;
    }
    if(v == 4){
      if(d == "d"){
        l++;
      }else{
        ln++;
      }
    }
  }

  static checkHorizontal(int index, List<String> s,String d){
    int a = index;
    int b = index;
    int h = 0;
    while(a%5 != 0){
      a -= 1;
      if(s[a] == "X"){
        h++;
      }
    }
    while((b+1)%5 != 0){
      if(s[b+1] == "X"){
        h++;
      }
      b += 1;
    }
    if(h == 4){
      if(d == "d"){
        l++;
      }else{
        ln++;
      }
    }
  }

 static refresh(){
        HomeData.display = [
          '',
          '',
          '',
          '',
          '',
          '',
          '',
          '',
          '',
          '',
          '',
          '',
          '',
          '',
          '',
          '',
          '',
          '',
          '',
          '',
          '',
          '',
          '',
          '',
          ''
        ];
        HomeData.nandandis2 = [
          '',
          '',
          '',
          '',
          '',
          '',
          '',
          '',
          '',
          '',
          '',
          '',
          '',
          '',
          '',
          '',
          '',
          '',
          '',
          '',
          '',
          '',
          '',
          '',
          ''
        ];
        HomeData.ln = 0;
        restart = false;
        HomeData.autoFill = true;
        HomeData.switchPlayers = true;
        HomeData.once = true;
        HomeData.player = true;
        HomeData.ab = 1;
        HomeData.ab2 = 1;
        HomeData.l = 0;
        HomeData.d1 = 0;
        HomeData.d2 = 0;
        HomeData.d1n = 0;
        HomeData.d2n = 0;
        HomeData.le = false;
        HomeData.gameOver = false;
  }
}