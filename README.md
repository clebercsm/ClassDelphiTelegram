# ClassDelphiTelegram
Classe Delphi para enviar mensagem para o Telegram.

Leia a documentação da API Telegram para criar seu botTelegram e saber mais a respeito.

Segue exemplo de como utilizar a Classe:

uses
  ..., _Telegram;

procedure TForm1.Button1Click(Sender: TObject);
var
  vv: T_Telegram;
  vSeuToken, vIdDestinatario, vMensagem: String; 
begin

  // Seu token (o token abaixo é um exemplo que está disponível na documentação da API Telegram)
  vSeuToken := '110201543:AAHdqTcvCH1vGWJxfSeofSAs0K5PALDsaw';
  
  // ID do destinatário
  vIdDestinatario := '000000000';
  
  // Mensagem a ser enviada
  vMensagem := 'Olá';
  
  try
    vv := T_Telegram.Create(vSeuToken);
    Memo1.Text := vv.SendMessage(vIdDestinatario, vMensagem);
    
  finally
    vv.Destroy;
  end;
  
end;
