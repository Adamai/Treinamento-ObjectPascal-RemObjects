unit fServerDataModule;

{$I RemObjects.inc}

interface

uses
  SysUtils, Classes, uROClient, uROServer, uROIndyTCPServer,
  uROPoweredByRemObjectsButton, uROClientIntf, uROClasses,
  uROBinMessage, uROIndyHTTPServer;

type
  TServerDataModule = class(TDataModule)
    ROMessage: TROBinMessage;
    ROServer: TROIndyHTTPServer;
    procedure DataModuleCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  ServerDataModule: TServerDataModule;

implementation

{$IFDEF DELPHIXE2UP}
{%CLASSGROUP 'System.Classes.TPersistent'}
{$ENDIF}

{$R *.dfm}

procedure TServerDataModule.DataModuleCreate(Sender: TObject);
begin
  ROServer.Active := TRUE;
end;

end.
