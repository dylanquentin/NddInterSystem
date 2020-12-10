/// 
Class BP.parcProcess Extends Ens.BusinessProcessBPL
{

/// BPL Definition
XData BPL [ XMLNamespace = "http://www.intersystems.com/bpl" ]
{
<process language='objectscript' request='msg.retirerParcDmde' response='msg.retirerParcRpse' height='2000' width='2000' >
<context>
<property name='reservation' type='%Integer' instantiate='0' />
</context>
<sequence xend='200' yend='800' >
<call name='Réservation' target='Parc' async='0' xpos='200' ypos='250' >
<request type='msg.checkReservationDmde' >
<assign property="callrequest.plaque" value="request.plaque" action="set" />
</request>
<response type='msg.checkReservationRpse' >
<assign property="response.codeRetour" value="callresponse.codeRetour" action="set" />
<assign property="response.libErreur" value="callresponse.libErreur" action="set" />
<assign property="context.reservation" value="callresponse.reservation" action="set" />
</response>
</call>
<if name='Est-ce que la voiture est réservé ?' condition='context.reservation=0' xpos='200' ypos='350' xend='200' yend='700' >
<true>
<call name='Supprimer la voiture' target='Voiture' async='0' xpos='203' ypos='589' >
<request type='msg.suppressionVoitureDmde' >
<assign property="callrequest.plaque" value="request.plaque" action="set" />
</request>
<response type='msg.suppressionVoitureRpse' >
<assign property="response.codeRetour" value="callresponse.codeRetour" action="set" />
<assign property="response.libErreur" value="callresponse.libErreur" action="set" />
</response>
</call>
</true>
<false>
<assign name="code retour" property="response.codeRetour" value="&quot;KO&quot;" action="set" xpos='470' ypos='500' />
<assign name="lib erreur" property="response.libErreur" value="&quot;Voiture en cours de réservation&quot;" action="set" xpos='470' ypos='600' />
</false>
</if>
</sequence>
</process>
}

Storage Default
{
<Type>%Storage.Persistent</Type>
}

}
