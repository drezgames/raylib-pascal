program models_billboard;

{$APPTYPE CONSOLE}
{$R *.res}

uses
  System.SysUtils,
  common,
  raylib in '..\libs\raylib.pas';

var
  screenWidth, screenHeight: integer;
  cam: TCamera;
  bill: TTexture2D;
  billPosition: TVector3;

begin
  screenWidth := 800;
  screenHeight := 450;
  InitWindow(screenWidth, screenHeight,
    'raylib [models] example - drawing billboards');

  cam.position := TVector3.Create(5.0, 4.0, 5.0);
  cam.target := TVector3.Create(0.0, 2.0, 0.0);
  cam.up := TVector3.Create(0.0, 1.0, 0.0);
  cam.fovy := 45.0;
  cam.&type := CAMERA_PERSPECTIVE;

  bill := LoadTexture('res/textures/billboard.png');
  billPosition := TVector3.Create(0.0, 2.0, 0.0);

  SetCameraMode(cam, CAMERA_ORBITAL);
  SetTargetFPS(60);

  while not WindowShouldClose() do
  begin
    UpdateCamera(cam);
    BeginDrawing();
    ClearBackground(RAYWHITE);
    BeginMode3d(cam);
    DrawBillboard(cam, bill, billPosition, 2.0, WHITE);
    DrawGrid(10, 1.0);
    EndMode3D;
    DrawFPS(10, 10);
    EndDrawing();
  end;
  UnloadTexture(bill);
  CloseWindow();

end.
