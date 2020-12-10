/// 
Class BP.reservationProcess Extends Ens.BusinessProcessBPL
{

/// BPL Definition
XData BPL [ XMLNamespace = "http://www.intersystems.com/bpl" ]
{
<process language='objectscript' request='msg.reserverDmde' response='msg.reserverRpse' height='2000' width='2000' >
<context>
<property name='plaque' type='%String' instantiate='0' >
<parameters>
<parameter name='MAXLEN'  value='50' />
</parameters>
</property>
</context>
<sequence xend='200' yend='700' >
<call name='get voiture dispo by category' target='ReservationCategorie' async='0' xpos='200' ypos='250' >
<request type='msg.reserverCategorieDmde' >
<assign property="callrequest.category" value="request.category" action="set" />
<assign property="callrequest.startDate" value="request.startDate" action="set" />
<assign property="callrequest.endDate" value="request.endDate" action="set" />
</request>
<response type='msg.reserverCategorieRpse' >
<assign property="context.plaque" value="callresponse.plaque" action="set" />
<assign property="response.codeRetour" value="callresponse.codeRetour" action="set" />
<assign property="response.libErreur" value="callresponse.libErreur" action="set" />
</response>
</call>
<if name='Voiture disponible ?' condition='response.codeRetour="OK"' xpos='200' ypos='350' xend='200' yend='600' >
<true>
<call name='Reservation voiture' target='ReservationCategorie' async='0' xpos='335' ypos='500' >
<request type='msg.reserverVoitureDmde' >
<assign property="callrequest.plaque" value="context.plaque" action="set" />
<assign property="callrequest.startDate" value="request.startDate" action="set" />
<assign property="callrequest.endDate" value="request.endDate" action="set" />
</request>
<response type='msg.reserverVoitureRpse' >
<assign property="response.codeRetour" value="callresponse.codeRetour" action="set" />
<assign property="response.libErreur" value="callresponse.libErreur" action="set" />
</response>
</call>
</true>
</if>
</sequence>
</process>
}

Storage Default
{
<Type>%Storage.Persistent</Type>
}

}
