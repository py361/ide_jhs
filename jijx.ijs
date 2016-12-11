NB. J HTTP Server - jijx app
coclass'jijx'
coinsert'jhs'

HBS=: 0 : 0
jhma''
jhjmlink''
actionmenu''
debugmenu''
'studio'   jhmg'studio';1;14
 'watch'   jhmab'watch'
 'sp'      jhmab'sp'
 'demo'    jhmab'demos'
 'app'     jhmab'app building'
 'debug'   jhmab'debug'
 'advance' jhmab'advance ctrl+.'
 'lab'     jhmab'labs...'
'tour'     jhmg'tour';1;4
 'j1'      jhmab'J 1'
 'j2'      jhmab'J 2'
 'j3'      jhmab'J 3'
 'plot'    jhmab'plot'
 'spx'     jhmab'spx'
jhmz''
'scratchdlg' jhdivadlg''
'scratcharea'jhtextarea'';1;1
'</div>'

'labsdlg'   jhdivadlg''
 'labrun'   jhb'run'
 labsel''
 'labsclose'jhb'X'
'</div>'
jhresize''
'log' jhec'<LOG>'
)

jev_get=: create

NB. move new transaction(s) to log
uplog=: 3 : 0
LOG_jhs_=: LOG,LOGN
LOGN_jhs_=: ''
)

NB. y is J prompt - '' '   ' or '      '
NB. called at start of input
NB. ff/safari/chrome collapse empty div (hence bull)
NB. empty prompt is &bull; which is removed if present from input
urlresponse=: 3 : 0
if. 0=#y do.
 t=. JZWSPU8
 PROMPT_jhs_=: JZWSPU8
else.
 t=. (6*#y)$'&nbsp;'
 PROMPT_jhs_=: y
end.
t=. '<div id="prompt" class="log">',t,'</div>'
d=. LOGN,t
uplog''
if. METHOD-:'post' do.
 if. CHUNKY do.
  CHUNKY_jhs_=: 0
  jhrajax_z d
 else.
  jhrajax d
 end. 
else.
 create''
end.
)

NB. refresh response - not jajax
create=: 3 : 0
uplog''
'jijx' jhr 'LOG';LOG
)

getlabs=: 3 : 0
LABTITLES=: LABCATS=: LABFILES=: ''
t=. jpath'~addons/labs/labs'
if. -.fexist t,'/lab.ijs' do. LABCATS=: LABFILES=:  LABTITLES=: ''  return. end.
require__ t,'/lab.ijs'
labaddons_jlab_''
labs=. sort labgetfiles_jlab_''
labs=. labs |.~ 0 i.~ ({."1 labs)=<'Addons'
LABCATS=: 0{"1 labs
LABFILES=: 2{"1 labs
LABTITLES=: LABCATS ,each (<': ') ,each 1{"1 labs
)

labsel=: 3 : 0
getlabs''
>(0~:#LABTITLES){'';'labsel'jhselect LABTITLES;1;0
)

updn=: 3 : 0
if. IP do. hmga y else. ' ' end.
)

labopen=: 3 : 0
ev_dot_ctrl_jijx_=: ev_advance_click
require__'~addons/labs/labs/lab.ijs'
smselout_jijs_=: smfocus_jijs_=: [ NB. allow introcourse to run
labinit_jlab_ y{LABFILES
)

ev_advance_click=: 3 : 0
if. #LABFILE_jlab_ do.  labnext_jlab_'' else. smoutput 'No lab open. Do studio|labs...' end.
)

ev_labrun_click=: 3 : 0
labopen ".getv'jsid'
)

jloadnoun_z_=: 0!:100

ev_scratchr_click=: 3 : 0
try. jloadnoun__ getv'scratcharea' catch. 13!:12'' end.
)

ev_clearrefresh_click=: 3 : 'LOG_jhs_=: '''''

actionmenu=: 3 : 0
a=. 'action'   jhmg'action';1;13
a=. a,'scratch' jhmab'scratch...'
a=. a,'scratchr'jhmab'scratch r^'
a=. a,'clearwindow'jhmab'clear window'
a=. a,'clearrefresh'jhmab'clear refresh'
a=. a,'clearLS'jhmab'clear LS'
t=. a
if. fexist'~user/projects/ja/ja.ijs' do.
 try.
  load'~user/projects/ja/ja.ijs'
  amenu=: <;._2 ja_menu
  for_i. i.#amenu do.
   t=. t,('actionn*',":i)jhmab(>i{amenu),>(i<3){'';' ',(i{'qwe       '),'^'
  end.
 catch.
  t=. a
 end.
end.
t
)

ev_action_click=:  3 : 0
smoutput 'see help ijx menu action for customization info'
)

action=: 3 : 0
".'''''',~'ja_',(>y{amenu),'_base_'
)

ev_actionn_click=: 3 : 0
action ".getv'jsid'
)

labmsg=: 0 : 0
No labs installed.
Do pacman labs/labs install and try again.

Labs are interactive tutorials and are a good
way to learn J.

Labs are not always current with the latest system
and may run with minor errors that can be ignored.
)

ev_lab_click=: 3 : 'smoutput labmsg' NB. no labs to select

debugmenu=: 3 : 0
t=.   'debug'    jhmg'debug';1;9
t=. t,'dbstep'   jhmab'dbstep    s^'
t=. t,'dbstepin' jhmab'dbstepin  i^'
t=. t,'dbstepout'jhmab'dbstepout o^'
t=. t,'dbcutback'jhmab'dbcutback'
t=. t,'dbrun'    jhmab'dbrun'
t=. t,'dbnxt'    jhmab'dbnxt'
)

studio_app=: 0 : 0
how to build an app
run and study each script/app in order
   runapp_jhs_ N
    - copies appN.ijs to ~temp/app
    - runs and opens script in a tab
    - opens the app in a tab
move the 2 new tabs so you can easily study them

 1 HBS - html
 2 JS - javascript event handlers
 3 J event handlers
 4 CSS - cascading style sheets
 5 INC - include css/js libraries
 6 window id and arg - customize jev_get page display
 
   runapp_jhs_ 1
)

studio_demos=: 0 : 0
demos are simple apps that show aspects of JHS gui programming
run the demos to see some of the possibilities
study the source to see how it is done
study studio|app building first as the demo source will make more sense after that

1  Roll submit
2  Roll ajax
3  Flip ajax
4  Controls/JS/CSS
5  Plot
6  Grid editor
7  Table layout
8  Dynamic resize
9  Multiple frames
10 Ajax chunks
11 Ajax interval timer
12 WebGL 3d graphics
13 D3 line and bar plots

   rundemo_jhs_ 1
)

studio_watch=: 0 : 0
   'W1'jwatch'?2 3$100' NB. watch any expression
)

studio=: 3 : 0
jhtml'<hr/>'
echo y
jhtml'<hr/>'
)

ev_app_click=:   3 : 'studio studio_app'
ev_demo_click=:  3 : 'studio studio_demos'

ev_j1_click=:  3 : 0
jhtml'<hr>'
echo'J 1'
spx'~addons/ide/jhs/spx/j1.ijs'
jhtml'<hr/>'
)

ev_j2_click=:  3 : 0
jhtml'<hr>'
echo'J 2'
spx'~addons/ide/jhs/spx/j2.ijs'
jhtml'<hr/>'
)

ev_j3_click=:  3 : 0
jhtml'<hr>'
echo'J 3'
spx'~addons/ide/jhs/spx/j3.ijs'
jhtml'<hr/>'
)

ev_plot_click=:  3 : 0
jhtml'<hr>'
echo'plot tour'
spx'~addons/ide/jhs/spx/plot.ijs'
jhtml'<hr/>'
)

ev_spx_click=:  3 : 0
jhtml'<hr>'
echo'spx tour'
spx'~addons/ide/jhs/spx/spx.ijs'
jhtml'<hr/>'
)

ev_watch_click=: 3 : 'studio studio_watch'
ev_debug_click=: 3 : 'studio studio_debug'
ev_sp_click=:    3 : 'studio sphelp'

ev_dbstep_click=: 3 : 0
echo'dbstep' try. dbstep'' catch. end. i.0 0
)

ev_dbstepin_click=: 3 : 0
echo'dbstepin' try. dbstepin'' catch. end. i.0 0
)

ev_dbstep_click=: 3 : 0
echo'dbstep' try. dbstep'' catch. end. i.0 0
)

ev_dbstepout_click=: 3 : 0
echo'dbstepout' try. dbstepout'' catch. end. i.0 0
)

ev_dbcutback_click=: 3 : 0
echo'dbcutback' try. dbcutback'' catch. end. i.0 0
)

ev_dbrun_click=: 3 : 0
echo'dbrun' try. dbrun'' catch. end. i.0 0
)

ev_dbnxt_click=: 3 : 0
echo'dbnxt' try. dbnxt'' catch. end. i.0 0
)

NB. default ctrl+,./ handlers
ev_comma_ctrl =: 3 : 'sp__'''''
ev_dot_ctrl   =: 3 : 'i.0 0'
ev_slash_ctrl  =: 3 : 'i.0 0'
ev_less_ctrl   =: 3 : 'i.0 0'
ev_larger_ctrl =: 3 : 'i.0 0'
ev_query_ctrl =: 3 : 'i.0 0'

CSS=: 0 : 0
*{font-family:<PC_FONTFIXED>;}
form{margin-top:0;margin-bottom:0;}
*.fm   {color:<PC_FM_COLOR>;}
*.er   {color:<PC_ER_COLOR>;}
*.log  {color:<PC_LOG_COLOR>;}
*.sys  {color:<PC_SYS_COLOR>;}
*.file {color:<PC_FILE_COLOR>;}
)

NB. *#log:focus{border:1px solid red;}
NB. *#log:focus{outline: none;} /* no focus mark in chrome */

JS=: 0 : 0
var phead= '<div id="prompt" class="log">';
var ptail= '</div>';
var globalajax; // sentence for enter setTimeout ajax
var TOT= 1;     // timeout time to let DOM settle before change
//var TOT= 100; // might need more time on slow devices???

function ev_body_focus(){if(!jisiX)setTimeout(ev_2_shortcut,TOT);}

function ev_body_load()
{

 jbyid("scratcharea").style.width="100%";
 jbyid("scratcharea").setAttribute("rows","8");
 jseval(false,jbyid("log").innerHTML); // redraw canvas elements
 newpline("   ");
 jresize();
}

var setvkb = function()
{
 var sx = document.body.scrollLeft, sy = document.body.scrollTop;
 var naturalHeight = window.innerHeight;
 window.scrollTo(sx, document.body.scrollHeight);
 VKB= naturalHeight - window.innerHeight;
 window.scrollTo(sx, sy);
 jresize();
}

function setfocus(){jbyid("log").focus();}

// iX must get VKB and resize when log gets focus
// iX does not call onfocus the first time - so we also do setvkb in enter
function jecfocus()
{
 if(jisiX)
 { 
  setTimeout(setvkb(),TOT);
  setTimeout(scrollz(),TOT);
 }
}

// iX must get VKB and resize when log loses focus
function jecblur(){if(jisiX)setTimeout(setvkb(),TOT);}

// remove id - normally 1 but could be none or multiples
// remove id parent if removal of id makes it empty
function removeid(id)
{
 var parnt;
 while(1)
 {
  p= jbyid(id);
  if(null==p) break;
  parnt= p.parentNode;
  parnt.removeChild(p);
  if(0==parnt.childNodes.length) parnt.parentNode.removeChild(parnt);
 }
}

function updatelog(t)
{
 var p,parent,n= document.createElement("div");
 n.innerHTML= t;
 removeid("prompt");
 jbyid("log").appendChild(n);
 setTimeout(scrollz,TOT); // allow doc to update
}

function scrollz()
{
 setfocus(); // required by ff
 if(null==jbyid("prompt"))return;
 jsetcaret("prompt",1);
 jbyid("prompt").scrollIntoView(false);
}

function scrollchunk(){jbyid("chunk").scrollIntoView(false);}

// ajax update window with new output
function ajax(ts)
{
 updatelog(ts[0]);
 jseval(true,ts[0]);
}

// ajax update window with new output
function ev_log_enter_ajax()
{
 updatelog(rq.responseText.substr(rqoffset));
 jseval(true,rq.responseText.substr(rqoffset));
}

function ev_log_enter_ajax_chunk()
{
 // jijx echo marks end of chunk with <!-- chunk --> 
 jbyid("log").blur();
 var i=rq.responseText.lastIndexOf("<!-- chunk -->");
 if(i>rqoffset) // have a chunk
 {
  if(rqoffset==0) removeid("prompt"); // 1st chunk contains input line so must remove original
  rqchunk= rq.responseText.substr(rqoffset,i-rqoffset);
  rqoffset= i+14; // skip <!-- chunk -->
  var n= document.createElement("div");
  removeid("chunk");
  n.innerHTML= rqchunk+'<div id="chunk"></div>';
  jbyid("log").appendChild(n);
  jseval(true,rqchunk);
  setTimeout(scrollchunk,1);
 } 
}

function ev_2_shortcut(){scrollz();}

function ev_3_shortcut(){jbyid("scratcharea").focus();}

function newpline(t)
{
 t= t.replace(/&/g,"&amp;");
 t= t.replace(/</g,"&lt;");
 t= t.replace(/>/g,"&gt;");
 t= t.replace(/ /g,"&nbsp;");
 t= t.replace(/-/g,"&#45;");
 t= t.replace(/\"/g,"&quot;");
 updatelog(phead+t+ptail);
}

// function keyp(){jbyid("kbsp").style.display= "block";scrollz();return true;} // space for screen kb

function ev_up_click(){uarrow();}
function ev_dn_click(){darrow();}

// log enter - contenteditable
// run or recall line with caret
// ignore multiple-line selection for now
function ev_log_enter()
{
 var t,sel,rng,tst,n,i,j,k,p,q,recall=0,name;
 if(jisiX)setvkb();
 if(window.getSelection)
 {
  sel= window.getSelection();
  rng= sel.getRangeAt(0);
  if(0!=rng.toString().length)return;
  jdominit(jbyid("log"));
  q=rng.commonAncestorContainer;

  for(i=0;i<jdwn.length;++i) // find selection in dom
   if(q==jdwn[i])break;

  for(j=i;j>=0;--j)   // backup find start DIV/P/BR
  {name=jdwn[j].nodeName;if(name=="DIV"||name=="BR"||name=="P")break;}

  for(k=i+1;k<jdwn.length;++k) // forward to find end DIV/P/BR or end
  {name=jdwn[k].nodeName;if(name=="DIV"||name=="BR"||name=="P")break;}

  rng.setStart(jdwn[j],0);
  recall=!(k==jdwn.length||k==jdwn.length-1);
  if(!k==jdwn.length)
    rng.setEnd(jdwn[k],0);
  else
    rng.setEndAfter(jdwn[k-1],0)
  t= rng.toString();
  t= t.replace(/\u00A0/g," "); // &nbsp;
 }
 else
 {
  p= jbyid("prompt");
  rng= document.selection.createRange();
  t= rng.text;
  if(0!=t.length) return; // IE selection has LF, but ignore for now
  // IE -  move left until CR or NaN - move right til no change
  while(1)
  {
    rng.moveStart('character',-1);
    t= rng.text;
    if(t.charAt(0)=='\r'||isNaN(t.charCodeAt(0))){rng.moveStart('character',1); break;}
  }
  while(1)
  {
    n= rng.text.length; // no size change for CRLF
    rng.moveEnd('character',1);
    if(n==rng.text.length){rng.moveEnd('character',-1); break;}
  }
  t= rng.text;
  if(null!=p)// last line exec vs old line recall
  {
   tst= document.selection.createRange();
   tst.moveToElementText(jbyid("prompt"));
   tst.collapse(true);
   recall= -1!=tst.compareEndPoints("EndToEnd",rng);
  }
 }
 if(recall)
 {
  t= t.replace(/ /g,"\u00A0"); // space -> &nbsp;
  newpline(t);
 }
 else
 {
  adrecall("document",t,"-1");
  globalajax= t;
  setTimeout(TOajax,TOT);
 }
}

// firefox can't do ajax call withint event handler (default action runs)
function TOajax(){jdoajax([],"",globalajax,true);}

function document_recall(v){newpline(v);}

function ev_advance_click(){jdoajax([]);}

function ev_app_click() {jdoajax([]);}
function ev_demo_click(){jdoajax([]);}
function ev_j1_click(){jdoajax([]);}
function ev_j2_click(){jdoajax([]);}
function ev_j3_click(){jdoajax([]);}
function ev_plot_click(){jdoajax([]);}
function ev_spx_click(){jdoajax([]);}
function ev_watch_click(){jdoajax([]);}
function ev_debug_click(){jdoajax([]);}
function ev_sp_click(){jdoajax([]);}
function ev_spx_click(){jdoajax([]);}

function ev_lab_click()
{
 if(null==jbyid("labsel"))
  jdoajax([],"");
 else
 jdlgshow("labsdlg","labsel");
}

function ev_labsclose_click(){jhide("labsdlg");ev_2_shortcut();}

function ev_scratch_click(){jdlgshow("scratchdlg","scratcharea");}
function ev_scratchclose_click(){jhide("scratchdlg");}

function ev_scratchr_click(){jdoajax(["scratcharea"]);}

function ev_clearwindow_click(){jbyid("log").innerHTML= "";newpline("   ");}
function ev_clearrefresh_click(){jdoajax([]);}
function ev_clearLS_click(){localStorage.clear();};

function ev_r_shortcut(){jscdo("scratchr");}

function ev_labrun_click()
{
 jhide("labsdlg");
 jform.jsid.value= jbyid("labsel").selectedIndex;
 jdoajax([],"");
}

function ev_actionn_click(){jdoajax([]);}

function ev_q_shortcut(){jscdo("actionn","0");}
function ev_w_shortcut(){jscdo("actionn","1");}
function ev_e_shortcut(){jscdo("actionn","2");}

function ev_dbstep_click()   {jdoajax([]);}
function ev_dbstepin_click() {jdoajax([]);}
function ev_dbstepout_click(){jdoajax([]);}
function ev_dbcutback_click(){jdoajax([]);}
function ev_dbrun_click()    {jdoajax([]);}
function ev_dbnxt_click()    {jdoajax([]);}
function ev_s_shortcut(){jscdo("dbstep");}
function ev_i_shortcut(){jscdo("dbstepin");}
function ev_o_shortcut(){jscdo("dbstepout");}
function ev_comma_ctrl(){jdoajax([]);}
function ev_dot_ctrl(){jdoajax([]);}
function ev_slash_ctrl(){jdoajax([]);}
function ev_less_ctrl(){jdoajax([]);}
function ev_larger_ctrl(){jdoajax([]);}
function ev_query_ctrl(){jdoajax([]);}
function ev_scratcharea_enter(){return true;}
)
