unit Providers.Connection;

interface

uses System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.ConsoleUI.Wait,
  Data.DB, FireDAC.Comp.Client, FireDAC.Phys.FB, FireDAC.Phys.FBDef,
  FireDAC.VCLUI.Wait, FireDAC.Phys.SQLite, FireDAC.Phys.SQLiteDef,
  FireDAC.Stan.ExprFuncs, FireDAC.Phys.SQLiteWrapper.Stat;

type
  TProvidersConnection = class(TDataModule)
    FDConnection: TFDConnection;
    procedure FDConnectionBeforeConnect(Sender: TObject);
  end;

implementation

{$R *.dfm}

procedure TProvidersConnection.FDConnectionBeforeConnect(Sender: TObject);
begin
  FDConnection.Params.Clear;
  FDConnection.Params.Add('DriverID=SQLite');
  FDConnection.Params.Add('LockingMode=Normal');
  FDConnection.Params.Add('BusyTimeout=5000');
  FDConnection.Params.Database := ExpandFileName(ExtractFilePath(ParamStr(0)) + '..\..\..\..\database\TASK_MANAGER.db');
end;

end.
