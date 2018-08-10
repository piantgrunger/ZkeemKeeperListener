unit UnitMain;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.OleCtrls,
  zkemkeeper_TLB;

type
  TForm1 = class(TForm)
    CZKEM1: TCZKEM;
    GroupBox1: TGroupBox;
    MM_IP_masuk: TMemo;
    Status: TGroupBox;
    lb_stat: TListBox;
    Button1: TButton;
    Button2: TButton;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
        procedure CZKEM1AttTransactionEx(Sender: TObject;
      const EnrollNumber: WideString; IsInValid, AttState, VerifyMethod,
      Year, Month, Day, Hour, Minute, Second, WorkCode: Integer);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
    CZKem : array of TCZKEM;

implementation

{$R *.dfm}

procedure TForm1.Button1Click(Sender: TObject);
var
    i:integer;
    bIsConnected :boolean;
begin
     SetLength(CZkem,MM_IP_masuk.Lines.Count);

     for i:= 0 to MM_IP_masuk.Lines.Count-1 do
     begin
         if not assigned(CZKem[i]) then
            CZKem[i]  := TCZKEM.Create(self);
         bIsConnected :=  CZKem[i].Connect_Net(MM_IP_masuk.Lines[i],4370);
         if  bIsConnected then
         begin
           lb_stat.Items.Add(MM_IP_masuk.Lines[i]+' - Connection Success  ');
           CZKem[i].MachineNumber :=i;
           if CZKem[i].RegEvent(i,1) then
           begin
             lb_stat.Items.Add(MM_IP_masuk.Lines[i]+' - Listening  port 4370 ');
             CZKem[i].OnAttTransactionEx := CZKEM1AttTransactionEx;
           end
           else    lb_stat.Items.Add(MM_IP_masuk.Lines[i]+' - Listening Fail ');
           Button1.Enabled := False;
           Button2.Enabled := True;

          end
          else
            lb_stat.Items.Add(MM_IP_masuk.Lines[i]+' - Connection Success  ');
          Application.ProcessMessages;
     end;

end;

procedure TForm1.Button2Click(Sender: TObject);
var
    i:integer;
begin

     for i:= 0 to MM_IP_masuk.Lines.Count-1 do
     begin
           CZKem[i].Disconnect;
           lb_stat.Items.Add(MM_IP_masuk.Lines[i]+' - Disconnected   ');
           Button1.Enabled := True;
           Button2.Enabled := False;

           Application.ProcessMessages;
     end;

end;

procedure TForm1.CZKEM1AttTransactionEx(Sender: TObject;
  const EnrollNumber: WideString; IsInValid, AttState, VerifyMethod, Year,
  Month, Day, Hour, Minute, Second, WorkCode: Integer);
var IP,flag,pesan : string;
begin
    ip:= MM_IP_masuk.Lines[TCZKEM(sender).MachineNumber] + '-  '+inttostr(AttState);
      pesan := IP+'  '+EnrollNumber+' ~ '+FormatDateTime('dd/mm/yyy HH:nn:ss ',EncodeDate(Year,Month,Day)+EncodeTime(Hour,Minute,Second,0)) ;
      ip := copy(ip,0,pos('-',ip)-1);
        lb_stat.Items.Add(pesan);

end;

end.
