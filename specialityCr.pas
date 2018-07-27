unit specialityCr;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls,NewLibrary_Intf,
  Data.DBXMySQL, Data.FMTBcd, Datasnap.DBClient, Datasnap.Provider, Data.DB, Data.SqlExpr,
  controller;

type
  TFormSp = class(TForm)
    Panel2: TPanel;
    Confirmar: TButton;
    Cancelar: TButton;
    Panel1: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Edit1: TEdit;
    Edit2: TEdit;
    CheckBox1: TCheckBox;
    ComboBox1: TComboBox;
    procedure CancelarClick(Sender: TObject);
    procedure ConfirmarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    Alterar: Boolean;
    ClientDataSet : TClientDataSet;
  end;

var
  FormSp: TFormSp;

implementation

procedure TFormSp.CancelarClick(Sender: TObject);
begin
  close;
end;

procedure TFormSp.ConfirmarClick(Sender: TObject);
var
  res : boolean;
  flag : boolean;
  CSpeciality : speciality;
begin
  CSpeciality := speciality.Create;
  try
    res := false;
    flag := false;
    if CheckBox1.State = cbChecked then
    begin
      flag:=true;
    end;
    if ((CheckBox1.State = cbChecked) or (CheckBox1.State = cbUnchecked))
    and (Edit1.GetTextLen > 0) and (Edit2.GetTextLen > 0) and (ComboBox1.GetTextLen > 0) then
    begin
      if alterar = true then
      begin
        CSpeciality.id := Edit1.Text;
        CSpeciality.comando := specCMDDetalhes;
        CSpeciality := Tcontroller.getinstance.ctrlspeciality(CSpeciality, ClientDataSet);
        CSpeciality.description := Edit2.Text;
        CSpeciality.flag_funcao_oper := flag;
        CSpeciality.codg_admingroup_fk := ComboBox1.Text;
        CSpeciality.comando := specCMDAlterar;
        Tcontroller.getinstance.ctrlspeciality(CSpeciality, ClientDataSet);
        res := true;
      end
      else
      begin
        CSpeciality.id := Edit1.Text;
        CSpeciality.description := Edit2.Text;
        CSpeciality.flag_funcao_oper := flag;
        CSpeciality.codg_admingroup_fk := ComboBox1.Text;
        CSpeciality.comando := specCMDInserir;
        CSpeciality := Tcontroller.getinstance.ctrlspeciality(CSpeciality, ClientDataSet);
        res := true;
        if CSpeciality <> nil then
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
    Cspeciality.free;    //DESTROY????????????
  end;
end;

procedure TFormSp.FormCreate(Sender: TObject);
begin
  tcontroller.getinstance.carregarCBAdmGroup(combobox1);
  ComboBox1.Style := csDropDownList;
end;


{$R *.dfm}


end.
