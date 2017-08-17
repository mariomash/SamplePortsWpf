å
RD:\Users\mario\source\repos\SamplePortsWpf\SamplePortsWpf\ReceivedDataEventArgs.cs
	namespace 	
SamplePortsWpf
 
{ 
public 

class !
ReceivedDataEventArgs &
:' (
	EventArgs) 2
{ 
public 
string 
Message 
{ 
get  #
;# $
}% &
public		 !
ReceivedDataEventArgs		 $
(		$ %
string		% +
message		, 3
)		3 4
{

 	
Message 
= 
message 
; 
} 	
} 
} Ï 
MD:\Users\mario\source\repos\SamplePortsWpf\SamplePortsWpf\ValueDialog.xaml.cs
	namespace 	
SamplePortsWpf
 
{ 
public 

partial 
class 
ValueDialog $
:% &
Window' -
{ 
private 
readonly 
	AsyncPort "
_port# (
;( )
public 
ValueDialog 
( 
	AsyncPort $
port% )
)) *
{ 	
_port 
= 
port 
; 
InitializeComponent 
(  
)  !
;! "
DataContext 
= 
this 
; 
} 	
private 
void 7
+TextBox_OnPreviewTextInputValidationTextBox @
(@ A
objectA G
senderH N
,N O$
TextCompositionEventArgsP h
ei j
)j k
{ 	
var 
regex 
= 
new 
Regex !
(! "
$str" +
)+ ,
;, -
e 
. 
Handled 
= 
regex 
. 
IsMatch %
(% &
e& '
.' (
Text( ,
), -
;- .
} 	
private 
void 
Button_OnClick #
(# $
object$ *
sender+ 1
,1 2
RoutedEventArgs3 B
eC D
)D E
{ 	
var 
value 
= 
TextBox 
.  
Text  $
;$ %
if!! 
(!! 
new!! 
PortValidationRule!! &
(!!& '
)!!' (
.!!( )
Validate!!) 1
(!!1 2
value!!2 7
,!!7 8
CultureInfo!!9 D
.!!D E
CurrentCulture!!E S
)!!S T
!=!!U W
ValidationResult!!X h
.!!h i
ValidResult!!i t
)!!t u
return"" 
;"" 
_port$$ 
.$$ 
SendData$$ 
($$ 
value$$  
)$$  !
;$$! "
Close%% 
(%% 
)%% 
;%% 
}&& 	
}(( 
public** 

class** 
PortValidationRule** #
:**$ %
ValidationRule**& 4
{++ 
public,, 
override,, 
ValidationResult,, (
Validate,,) 1
(,,1 2
object,,2 8
value,,9 >
,,,> ?
CultureInfo,,@ K
cultureInfo,,L W
),,W X
{-- 	
if.. 
(.. 
string.. 
... 
IsNullOrEmpty.. $
(..$ %
value..% *
?..* +
...+ ,
ToString.., 4
(..4 5
)..5 6
)..6 7
)..7 8
return// 
new// 
ValidationResult// +
(//+ ,
false//, 1
,//1 2
$str//3 K
)//K L
;//L M
var11 
	isNumeric11 
=11 
int11 
.11  
TryParse11  (
(11( )
value11) .
.11. /
ToString11/ 7
(117 8
)118 9
,119 :
out11; >
int11? B
intValue11C K
)11K L
;11L M
if22 
(22 
!22 
	isNumeric22 
)22 
return33 
new33 
ValidationResult33 +
(33+ ,
false33, 1
,331 2
$str333 N
)33N O
;33O P
if55 
(55 
intValue55 
<55 
$num55 
||55 
intValue55  (
>55) *
$num55+ -
)55- .
return66 
new66 
ValidationResult66 +
(66+ ,
false66, 1
,661 2
$str663 J
)66J K
;66K L
return88 
new88 
ValidationResult88 '
(88' (
true88( ,
,88, -
null88. 2
)882 3
;883 4
}99 	
}:: 
};; •
ED:\Users\mario\source\repos\SamplePortsWpf\SamplePortsWpf\App.xaml.cs
	namespace		 	
SamplePortsWpf		
 
{

 
public 

partial 
class 
App 
: 
Application *
{ 
} 
} —1
FD:\Users\mario\source\repos\SamplePortsWpf\SamplePortsWpf\AsyncPort.cs
	namespace

 	
SamplePortsWpf


 
{ 
public 

class 
	AsyncPort 
: 
IDisposable (
{ 
private 
readonly 

SerialPort #
_serialPort$ /
;/ 0
private 
string 
_receivedData $
;$ %
public 
string 
ReceivedData "
{# $
set 
{ 
LastReceivedData  
=! "
DateTime# +
.+ ,
Now, /
;/ 0
_receivedData 
= 
value  %
;% &
if 
( 
_receivedData !
.! "
Length" (
==) +
$num, -
)- .
return 
; 
var 
args 
= 
new !
ReceivedDataEventArgs 4
(4 5
$"5 7
{7 8
_receivedData8 E
}E F
"F G
)G H
;H I
OnDataReceived 
? 
.  
Invoke  &
(& '
this' +
,+ ,
args- 1
)1 2
;2 3
} 
get 
=> 
$" 
{ 
_receivedData #
}# $
"$ %
;% &
}   	
public"" 
string"" 
Name"" 
{"" 
get""  
;""  !
set""" %
;""% &
}""' (
public$$ 
DateTime$$ 
LastReceivedData$$ (
;$$( )
public&& 
string&& '
LastReceivedDataHumanFormat&& 1
=>&&2 4
_receivedData&&5 B
!=&&C E
null&&F J
?&&K L
LastReceivedData&&M ]
.&&] ^
ToShortTimeString&&^ o
(&&o p
)&&p q
:&&r s
string&&t z
.&&z {
Empty	&&{ Ä
;
&&Ä Å
public(( 

PortStatus(( 
Status((  
{((! "
get((# &
;((& '
set((( +
;((+ ,
}((- .
public** 
event** 
DataHandler**  
OnDataReceived**! /
;**/ 0
public,, 
delegate,, 
void,, 
DataHandler,, (
(,,( )
object,,) /
obj,,0 3
,,,3 4!
ReceivedDataEventArgs,,5 J
args,,K O
),,O P
;,,P Q
public.. 
	AsyncPort.. 
(.. 
string.. 
portName..  (
)..( )
{// 	
Name00 
=00 
portName00 
;00 
Status11 
=11 

PortStatus11 
.11  
Disconnected11  ,
;11, -
_serialPort22 
=22 
new22 

SerialPort22 (
(22( )
Name22) -
)22- .
;22. /
ConnectPort33 
(33 
)33 
;33 
}44 	
public66 
void66 
SendData66 
(66 
string66 #
message66$ +
)66+ ,
{77 	
switch;; 
(;; 
message;; 
);; 
{<< 
case== 
$str== 
:== 
ReceivedData>>  
=>>! "
$str>># &
;>>& '
break?? 
;?? 
case@@ 
$str@@ 
:@@ 
breakBB 
;BB 
defaultCC 
:CC 
ReceivedDataDD  
=DD! "
$"DD# %
{DD% &
messageDD& -
}DD- .
"DD. /
;DD/ 0
breakEE 
;EE 
}FF 
}OO 	
privateQQ 
voidQQ 
ConnectPortQQ  
(QQ  !
)QQ! "
{RR 	
trySS 
{TT 
_serialPortUU 
.UU 
BaudRateUU $
=UU% &
$numUU' ,
;UU, -
_serialPortVV 
.VV 
	HandshakeVV %
=VV& '
	HandshakeVV( 1
.VV1 2
NoneVV2 6
;VV6 7
_serialPortWW 
.WW 
ParityWW "
=WW# $
ParityWW% +
.WW+ ,
NoneWW, 0
;WW0 1
_serialPortXX 
.XX 
DataBitsXX $
=XX% &
$numXX' (
;XX( )
_serialPortYY 
.YY 
StopBitsYY $
=YY% &
StopBitsYY' /
.YY/ 0
OneYY0 3
;YY3 4
_serialPortZZ 
.ZZ 
ReadTimeoutZZ '
=ZZ( )
$numZZ* -
;ZZ- .
_serialPort[[ 
.[[ 
WriteTimeout[[ (
=[[) *
$num[[+ -
;[[- .
_serialPort__ 
.__ 
DataReceived__ (
+=__) +
ReceivedDataHandler__, ?
;__? @
}ii 
catchjj 
(jj 
	Exceptionjj 
exjj 
)jj  
{kk 
Tracell 
.ll 
	WriteLinell 
(ll  
$"ll  "*
Couldn't initialize the port: ll" @
{ll@ A
exllA C
}llC D
"llD E
)llE F
;llF G
}mm 
}nn 	
privatepp 
voidpp 
ReceivedDataHandlerpp (
(pp( )
objectpp) /
senderpp0 6
,pp6 7'
SerialDataReceivedEventArgspp8 S
eppT U
)ppU V
{qq 	
varrr 
portrr 
=rr 
(rr 

SerialPortrr "
)rr" #
senderrr# )
;rr) *
varss 
datass 
=ss 
portss 
.ss 
ReadExistingss (
(ss( )
)ss) *
;ss* +
ReceivedDatatt 
=tt 
datatt 
;tt  
}uu 	
publicww 
voidww 
Disposeww 
(ww 
)ww 
{xx 	
_serialPortyy 
.yy 
Closeyy 
(yy 
)yy 
;yy  
_serialPortzz 
.zz 
Disposezz 
(zz  
)zz  !
;zz! "
}{{ 	
}|| 
}~~ Ω
LD:\Users\mario\source\repos\SamplePortsWpf\SamplePortsWpf\MainWindow.xaml.cs
	namespace 	
SamplePortsWpf
 
{ 
public 

partial 
class 

MainWindow #
:$ %
Window& ,
{  
ObservableCollection 
< 
	AsyncPort &
>& '
_availablePorts( 7
;7 8
public 

MainWindow 
( 
) 
{ 	
InitializeComponent 
(  
)  !
;! "
_availablePorts!! 
=!! 
new!! ! 
ObservableCollection!!" 6
<!!6 7
	AsyncPort!!7 @
>!!@ A
(!!A B
)!!B C
;!!C D
var## 
ports## 
=## 

SerialPort## "
.##" #
GetPortNames### /
(##/ 0
)##0 1
;##1 2
ports&& 
=&& 
new&& 
[&& 
]&& 
{&& 
$str&& %
,&&% &
$str&&' 1
}&&2 3
;&&3 4
foreach)) 
()) 
var)) 
portName)) !
in))" $
ports))% *
)))* +
{** 
var++ 
port++ 
=++ 
new++ 
	AsyncPort++ (
(++( )
portName++) 1
)++1 2
;++2 3
port,, 
.,, 
OnDataReceived,, #
+=,,$ &
ParseReceivedData,,' 8
;,,8 9
_availablePorts.. 
...  
Add..  #
(..# $
port..$ (
)..( )
;..) *
if00 
(00 
port00 
.00 
Name00 
==00  
$str00! +
)00+ ,
port11 
.11 
ReceivedData11 %
=11& '
$str11( +
;11+ ,
}33 
LvPorts55 
.55 
ItemsSource55 
=55  !
_availablePorts55" 1
;551 2
}66 	
private88 
void88 
ParseReceivedData88 &
(88& '
object88' -
sender88. 4
,884 5!
ReceivedDataEventArgs886 K
args88L P
)88P Q
{99 	
var:: 
port:: 
=:: 
(:: 
	AsyncPort:: !
)::! "
sender::" (
;::( )
if<< 
(<< 
args<< 
.<< 
Message<< 
==<< 
$str<<  $
)<<$ %
{== 
port>> 
.>> 
Status>> 
=>> 

PortStatus>> (
.>>( )
	Connected>>) 2
;>>2 3
}?? 
varAA 
viewAA 
=AA  
CollectionViewSourceAA +
.AA+ ,
GetDefaultViewAA, :
(AA: ;
_availablePortsAA; J
)AAJ K
;AAK L
viewBB 
.BB 
RefreshBB 
(BB 
)BB 
;BB 
}CC 	
privateEE 
voidEE 
Button_ClickEE !
(EE! "
objectEE" (
senderEE) /
,EE/ 0
RoutedEventArgsEE1 @
eEEA B
)EEB C
{FF 	
varGG 
buttonGG 
=GG 
(GG 
ButtonGG  
)GG  !
senderGG! '
;GG' (
ifII 
(II 
!II 
(II 
buttonII 
.II 
DataContextII $
isII% '
	AsyncPortII( 1
portII2 6
)II6 7
)II7 8
returnJJ 
;JJ 
portLL 
.LL 
SendDataLL 
(LL 
$strLL 
)LL 
;LL  
varNN 
popupNN 
=NN 
newNN 
ValueDialogNN '
(NN' (
portNN( ,
)NN, -
;NN- .
popupPP 
.PP 

ShowDialogPP 
(PP 
)PP 
;PP 
}RR 	
}SS 
}TT ú
GD:\Users\mario\source\repos\SamplePortsWpf\SamplePortsWpf\PortStatus.cs
	namespace 	
SamplePortsWpf
 
{ 
public 

enum 

PortStatus 
{ 
[ 	

EnumMember	 
] 
Disconnected !
,! "
[ 	

EnumMember	 
] 
	Connected 
}		 
}

 õ
TD:\Users\mario\source\repos\SamplePortsWpf\SamplePortsWpf\Properties\AssemblyInfo.cs
[

 
assembly

 	
:

	 

AssemblyTitle

 
(

 
$str

 )
)

) *
]

* +
[ 
assembly 	
:	 

AssemblyDescription 
( 
$str !
)! "
]" #
[ 
assembly 	
:	 
!
AssemblyConfiguration  
(  !
$str! #
)# $
]$ %
[ 
assembly 	
:	 

AssemblyCompany 
( 
$str 
) 
] 
[ 
assembly 	
:	 

AssemblyProduct 
( 
$str +
)+ ,
], -
[ 
assembly 	
:	 

AssemblyCopyright 
( 
$str 0
)0 1
]1 2
[ 
assembly 	
:	 

AssemblyTrademark 
( 
$str 
)  
]  !
[ 
assembly 	
:	 

AssemblyCulture 
( 
$str 
) 
] 
[ 
assembly 	
:	 


ComVisible 
( 
false 
) 
] 
["" 
assembly"" 	
:""	 

	ThemeInfo"" 
("" &
ResourceDictionaryLocation## 
.## 
None## #
,### $&
ResourceDictionaryLocation&& 
.&& 
SourceAssembly&& -
))) 
])) 
[66 
assembly66 	
:66	 

AssemblyVersion66 
(66 
$str66 $
)66$ %
]66% &
[77 
assembly77 	
:77	 

AssemblyFileVersion77 
(77 
$str77 (
)77( )
]77) *