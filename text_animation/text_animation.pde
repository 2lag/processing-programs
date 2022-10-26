//text sliding color

color bg = #434343, backtxt = #a2a2a2, overtxt = #bc4abc;
int mousepadding = 5, textpadtrack = 0;
String word = "s l i d i n g - c o l o r", wordnospace = "sliding-color";
String[] wordarr;

void setup() {
  size(400, 200);
}

void draw() {
  background(bg);
  textSize(50);
  wordarr = split(word, " ");
  textpadtrack = 0;
  for(int charpos = 0; charpos < wordarr.length; charpos++) {
    if(mouseX < ((width - textWidth(wordnospace)) / 2) + textpadtrack) { fill(backtxt); }
    if(mouseX > ((width - textWidth(wordnospace)) / 2) + textpadtrack + mousepadding) { fill(overtxt); }
    text(wordarr[charpos], ((width - textWidth(wordnospace)) / 2) + textpadtrack, height / 2);
    textpadtrack += textWidth(wordarr[charpos]);
  }
}
