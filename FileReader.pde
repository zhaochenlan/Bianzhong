Table table;
int[][] SheetMusic;
int SheetMusicSize;
int nextTime;
boolean onPlay = false;
int playTime;

void fileSelected(File selection) {
  if (selection == null) {
    println("Window was closed or the user hit cancel.");
    stop();
  } else {
    println("User selected " + selection.getAbsolutePath());
    ParsingTable(loadTable(selection.getAbsolutePath(), "header"));
  }
}

void outfileSelected(File selection) {
  if (selection == null) {
    println("Window was closed or the user hit cancel.");
  } else {
    saveTable(table,selection.getAbsolutePath()+".csv");
  }
}

void readFile() {
  selectInput("Select a file to process:", "fileSelected");
}

void creatTable() {
  table = new Table();
  table.addColumn("time");
  table.addColumn("ChimeId");
}

void saveTable() {
  selectOutput("Select a folder to save your reocrd:", "outfileSelected");
}

public void ParsingTable(Table readTable) {
  SheetMusicSize = readTable.getRowCount();
  SheetMusic = new int[SheetMusicSize][2];
  
  int i = 0;
  for (TableRow row : readTable.rows()) {    
    SheetMusic[i][0] = row.getInt("time");
    SheetMusic[i++][1] = row.getInt("ChimeId");
  }
  playTime = 0 ;
  onPlay = true;
  nextTime = 0;
}

public void play() {
  if(onPlay==true){
    if(playTime==SheetMusic[nextTime][0]){
    if(nextTime>=SheetMusicSize-1){
      stop();
    }
    for(int i=0;i<chimes.size();i++) {
      if(chimes.get(i).Id==SheetMusic[nextTime][1]){
        chimes.get(i).hit();
      }
    }
    nextTime++;
  }
  playTime++;
  }  
}

public void stop() {
  onPlay = false;
  Pb.on = false;
}
