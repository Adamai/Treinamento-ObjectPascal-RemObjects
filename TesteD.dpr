program TesteD;

{#ROGEN:NewLibrary.rodl} // RemObjects: Careful, do not remove!

uses
  uROComInit,
  uROComboService,
  Forms,
  fServerDataModule in 'fServerDataModule.pas' {ServerDataModule: TDataModule},
  fServerForm in 'fServerForm.pas' {ServerForm},
  NewLibrary_Intf in 'NewLibrary_Intf.pas',
  NewLibrary_Invk in 'NewLibrary_Invk.pas',
  NewService_Impl in 'NewService_Impl.pas' {NewService: TRORemoteDataModule},
  NewLibrary_Async in 'NewLibrary_Async.pas';

{$R *.res}
{$R RODLFile.res}

begin
  if ROStartService('TesteD', 'TesteD') then begin
    ROService.CreateForm(TServerDataModule, ServerDataModule);
    ROService.Run;
    Exit;
  end;

  Application.Initialize;
  Application.CreateForm(TServerDataModule, ServerDataModule);
  Application.CreateForm(TServerForm, ServerForm);
  Application.Run;
end.
