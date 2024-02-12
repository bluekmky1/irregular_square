# irregular_square
불규칙적인 사각형이 리스트로 보여지는 디자인이 멋져보여서 구현해봤습니다.

**ClipPath**를 사용해서 모서리가 둥근 사각형을 구현했습니다.

가로는 화면을 꽉 채우고 특정한 높이를 지닌 사각형을 먼저 그린 뒤 **ClipPath**의 **CustomClipper**를 사용하였습니다.

**clipper**의 **path**를 그리는 방식은 다음과 같습니다.

1. 4개의 랜덤한 꼭짓점의 좌표를 생성합니다.
   (어떤 모서리가 화면 끝에 붙어있을 지 정해주는 속성을 **IrregularRectClipper**에 추가시켜 놓았습니다.
   이에 따라 상/하 중 1개의 모서리와 좌/우 중 1개의 모서리는 무조건 직선이게 됩니다.)
   
2. 꼭짓점 부분을 둥글게 만들기 위한 호를 그리기 위한 좌표를 생성합니다. 호를 그리기 위한 함수로 **quadraticBezierTo()를** 사용했습니다.
   
   **quadraticBezierTo()는** 바이저 곡선을 그려주는 함수로 끝나는 지점의 x2, y2좌표와 변곡을 일으킬 기준점의 x1, y1좌표를 인자로 받습니다.

   x1,y1는 각 꼭짓점을 사용하고 호가 끝나는 지점인 x2와 y2를 구하기 위해서 모서리를 이루는 꼭짓점을 연결한 직선에서 일정한 길이만큼 떨어진 좌표를 구하면 됩니다.

   이 좌표는 꼭짓점들을 연결한 직선의 내분을 이용해서 구했습니다.
   
3. 총 8개의 내분점을 구해서 1~8까지의 번호를 붙여 구분했습니다. *ex)internalConflict_1*

  
4. 1번째 내분점으로 이동하기 위해 **moveTo()를** 사용해서 이동해줍니다.
 
5. 8개의 내분점을 **lineTo()**와 **quadraticBezierTo()를** 사용해서 사각형을 그려줍니다.

6. 멋진 곡선을 지닌 사각형이 나타납니다!!

## 결과
<img src="https://github.com/bluekmky1/irregular_square/assets/115731932/bb5291f2-5468-4ea6-b8ae-ac37010f0a4b.png" width="33%">

<img src="https://github.com/bluekmky1/irregular_square/assets/115731932/9e65045f-6292-45c9-9809-7ec50bfff9e9.png" width="33%">


디자인 레퍼런스:

https://dribbble.com/shots/18481472-Guide-App-Real-Estate
