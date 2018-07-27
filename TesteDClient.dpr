program TesteDClient;

uses
  uROComInit,
  Forms,
  fClientForm in 'fClientForm.pas' {ClientForm},
  Controller in 'Controller.pas',
  specialityCr in 'specialityCr.pas' {FormSp},
  AdminGroupGer in 'AdminGroupGer.pas' {FormAgGer},
  AdminGroupCr in 'AdminGroupCr.pas' {FormAG};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TClientForm, ClientForm);
  Application.CreateForm(TFormSp, FormSp);
  Application.CreateForm(TFormAgGer, FormAgGer);
  Application.CreateForm(TFormAG, FormAG);
  Application.Run;
end.
