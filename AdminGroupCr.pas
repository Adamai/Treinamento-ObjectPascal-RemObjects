unit AdminGroupCr;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, newlibrary_intf, controller,
  Vcl.StdCtrls, Data.DBXMySQL, Data.FMTBcd, Datasnap.DBClient, Datasnap.Provider, Data.DB, Data.SqlExpr, Vcl.ExtCtrls;

type
  TFormAG = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Edit1: TEdit;
    Edit2: TEdit;
    Panel2: TPanel;
    Confirmar: TButton;
    Cancelar: TButton;
    procedure ConfirmarClick(Sender: TObject);
    procedure CancelarClick(Sender: TObject);
  private
    { Private declarations }
  public
    Alterar: Boolean;
    ClientDataSet : TClientDataSet;
    Combo : TComboBox;
  end;

var
  FormAG: TFormAG;

implementation

{$R *.dfm}

procedure TFormAG.CancelarClick(Sender: TObject);
begin
 close;
end;

procedure TFormAG.ConfirmarClick(Sender: TObject);
var
  res : boolean;
  Cadmingroup : admingroup;
begin
  Cadmingroup := AdminGroup.Create;
  try
    res := false;
    if ((Edit1.GetTextLen > 0) and (Edit2.GetTextLen > 0)) then
    begin
      if alterar = true then
      begin
        Cadmingroup.id := Edit1.Text;
        Cadmingroup.comando := admCMDDetalhes;
        Cadmingroup := Tcontroller.getinstance.ctrladm(Cadmingroup, ClientDataSet);
        Cadmingroup.description := Edit2.Text;
        Cadmingroup.comando := admCMDAlterar;
        Tcontroller.getinstance.ctrladm(Cadmingroup, ClientDataSet);
        res := true;
      end
      else
      begin
        Cadmingroup.id := Edit1.Text;
        Cadmingroup.description := Edit2.Text;
        Cadmingroup.comando := admCMDInserir;
        Cadmingroup := Tcontroller.getinstance.ctrladm(Cadmingroup, ClientDataSet);
        res := true;
        if Cadmingroup <> nil then
          res := false;
      end;
      if res = true then
      begin
        close;
      end;
    end
    else
    begin
      showmessage('Todos os campos devem ser preenchidos');
    end;
  finally
    Cadmingroup.Free;
  end;
end;

end.
