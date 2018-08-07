program shapes_lines_bezier;

{$APPTYPE CONSOLE}

{$R *.res}

uses
  System.SysUtils,
  common,
  raylib in '..\libs\raylib.pas';

var
  start,
  &end : TVector2;
begin
  SetConfigFlags(FLAG_MSAA_4X_HINT);
  InitWindow(screenWidth, screenHeight, 'raylib [shapes] example - cubic-bezier lines');
  start.&Set(0,0);
  &end.&Set(screenWidth, screenHeight);
  SetTargetFPS(60);
  while  not WindowShouldClose() do
  begin
    if IsMouseButtonDown(MOUSE_LEFT_BUTTON) then start := GetMousePosition
    else if IsMouseButtonDown(MOUSE_RIGHT_BUTTON) then &end := GetMousePosition;
    BeginDrawing;
      ClearBackground(RAYWHITE);
      DrawText('USE MOUSE LEFT-RIGHT CLICK to DEFINE LINE START and END POINTS', 15, 20, 20, GRAY);
      DrawLineBezier(start, &end, 2.0, RED);
    EndDrawing;
  end;
  CloseWindow;
end.
