FasdUAS 1.101.10   ��   ��    k             l     ��  ��     V1     � 	 	  V 1   
  
 l      ��  ��   script pullCommitPush	set commitMsg to text returned of (display dialog "Commit message" default answer "Automated commit and push" giving up after 120)		set resultz to do shell script "cd ~/phpstormprojects/my-page ; echo Pull: ; git pull ; echo ; git add --all ; echo Commit: ; git commit -m '" & commitMsg & "' ; echo ; echo Push: ; git push -u origin master"		display dialog "Script results:\n\n" & resultz buttons {"OK"} default button 1 giving up after 15end scriptset choicing to button returned of (display dialog "Would you like to pull, commit, and push?" buttons {"Cancel", "No", "Yes"} default button 3)if choicing is "Yes" then	tell pullCommitPush to runend ifif choicing is "No" then	tell asks to runend ifscript commitOrPush	set choices to button returned of (display dialog "What would you like to do?" buttons {"Cancel", "Commit", "Push"} default button 2)		if choices is "Commit" then		set commitMsg to text returned of (display dialog "Commit message" default answer "Automated commit and push" giving up after 120)		set resultz to do shell script "cd ~/phpstormprojects/my-page ; git add --all ; echo Commit: ; git commit -m '" & commitMsg & "'"		display dialog "Script results:\n\n" & resultz buttons {"OK"} default button 1 giving up after 15	end if		if choices is "Push" then		set resultz to do shell script "cd ~/phpstormprojects/my-page ; echo Push: ; git push -u origin master"		display dialog "Script results:\n\n" & resultz buttons {"OK"} default button 1 giving up after 15	end if	end scriptscript pull	set resultz to do shell script "cd ~/phpstormprojects/my-page ; echo Pull: ; git pull"	display dialog "Script results:\n\n" & resultz buttons {"OK"} default button 1 giving up after 15end scriptscript asks	set choices to button returned of (display dialog "What would you like to do?" buttons {"Cancel", "Pull", "Commit or push"} default button 3)		if choices is "Pull" then		tell pull to run	end if		if choices is "Commit or push" then		tell commitOrPush to run	end if	end script     �   s c r i p t   p u l l C o m m i t P u s h  	 s e t   c o m m i t M s g   t o   t e x t   r e t u r n e d   o f   ( d i s p l a y   d i a l o g   " C o m m i t   m e s s a g e "   d e f a u l t   a n s w e r   " A u t o m a t e d   c o m m i t   a n d   p u s h "   g i v i n g   u p   a f t e r   1 2 0 )  	  	 s e t   r e s u l t z   t o   d o   s h e l l   s c r i p t   " c d   ~ / p h p s t o r m p r o j e c t s / m y - p a g e   ;   e c h o   P u l l :   ;   g i t   p u l l   ;   e c h o   ;   g i t   a d d   - - a l l   ;   e c h o   C o m m i t :   ;   g i t   c o m m i t   - m   ' "   &   c o m m i t M s g   &   " '   ;   e c h o   ;   e c h o   P u s h :   ;   g i t   p u s h   - u   o r i g i n   m a s t e r "  	  	 d i s p l a y   d i a l o g   " S c r i p t   r e s u l t s : \ n \ n "   &   r e s u l t z   b u t t o n s   { " O K " }   d e f a u l t   b u t t o n   1   g i v i n g   u p   a f t e r   1 5  e n d   s c r i p t   s e t   c h o i c i n g   t o   b u t t o n   r e t u r n e d   o f   ( d i s p l a y   d i a l o g   " W o u l d   y o u   l i k e   t o   p u l l ,   c o m m i t ,   a n d   p u s h ? "   b u t t o n s   { " C a n c e l " ,   " N o " ,   " Y e s " }   d e f a u l t   b u t t o n   3 )   i f   c h o i c i n g   i s   " Y e s "   t h e n  	 t e l l   p u l l C o m m i t P u s h   t o   r u n  e n d   i f   i f   c h o i c i n g   i s   " N o "   t h e n  	 t e l l   a s k s   t o   r u n  e n d   i f   s c r i p t   c o m m i t O r P u s h  	 s e t   c h o i c e s   t o   b u t t o n   r e t u r n e d   o f   ( d i s p l a y   d i a l o g   " W h a t   w o u l d   y o u   l i k e   t o   d o ? "   b u t t o n s   { " C a n c e l " ,   " C o m m i t " ,   " P u s h " }   d e f a u l t   b u t t o n   2 )  	  	 i f   c h o i c e s   i s   " C o m m i t "   t h e n  	 	 s e t   c o m m i t M s g   t o   t e x t   r e t u r n e d   o f   ( d i s p l a y   d i a l o g   " C o m m i t   m e s s a g e "   d e f a u l t   a n s w e r   " A u t o m a t e d   c o m m i t   a n d   p u s h "   g i v i n g   u p   a f t e r   1 2 0 )  	 	 s e t   r e s u l t z   t o   d o   s h e l l   s c r i p t   " c d   ~ / p h p s t o r m p r o j e c t s / m y - p a g e   ;   g i t   a d d   - - a l l   ;   e c h o   C o m m i t :   ;   g i t   c o m m i t   - m   ' "   &   c o m m i t M s g   &   " ' "  	 	 d i s p l a y   d i a l o g   " S c r i p t   r e s u l t s : \ n \ n "   &   r e s u l t z   b u t t o n s   { " O K " }   d e f a u l t   b u t t o n   1   g i v i n g   u p   a f t e r   1 5  	 e n d   i f  	  	 i f   c h o i c e s   i s   " P u s h "   t h e n  	 	 s e t   r e s u l t z   t o   d o   s h e l l   s c r i p t   " c d   ~ / p h p s t o r m p r o j e c t s / m y - p a g e   ;   e c h o   P u s h :   ;   g i t   p u s h   - u   o r i g i n   m a s t e r "  	 	 d i s p l a y   d i a l o g   " S c r i p t   r e s u l t s : \ n \ n "   &   r e s u l t z   b u t t o n s   { " O K " }   d e f a u l t   b u t t o n   1   g i v i n g   u p   a f t e r   1 5  	 e n d   i f  	  e n d   s c r i p t   s c r i p t   p u l l  	 s e t   r e s u l t z   t o   d o   s h e l l   s c r i p t   " c d   ~ / p h p s t o r m p r o j e c t s / m y - p a g e   ;   e c h o   P u l l :   ;   g i t   p u l l "  	 d i s p l a y   d i a l o g   " S c r i p t   r e s u l t s : \ n \ n "   &   r e s u l t z   b u t t o n s   { " O K " }   d e f a u l t   b u t t o n   1   g i v i n g   u p   a f t e r   1 5  e n d   s c r i p t   s c r i p t   a s k s  	 s e t   c h o i c e s   t o   b u t t o n   r e t u r n e d   o f   ( d i s p l a y   d i a l o g   " W h a t   w o u l d   y o u   l i k e   t o   d o ? "   b u t t o n s   { " C a n c e l " ,   " P u l l " ,   " C o m m i t   o r   p u s h " }   d e f a u l t   b u t t o n   3 )  	  	 i f   c h o i c e s   i s   " P u l l "   t h e n  	 	 t e l l   p u l l   t o   r u n  	 e n d   i f  	  	 i f   c h o i c e s   i s   " C o m m i t   o r   p u s h "   t h e n  	 	 t e l l   c o m m i t O r P u s h   t o   r u n  	 e n d   i f  	  e n d   s c r i p t      l     ��������  ��  ��        l     ��  ��     V2     �    V 2      l     ��������  ��  ��        l     ����  r         J     	       m          � ! ! $ P u l l ,   C o m m i t ,   P u s h   " # " m     $ $ � % %  P u l l ,   C o m m i t #  & ' & m     ( ( � ) )  C o m m i t ,   P u s h '  * + * m     , , � - -  P u l l ,   P u s h +  . / . m     0 0 � 1 1  P u l l /  2 3 2 m     4 4 � 5 5  C o m m i t 3  6�� 6 m     7 7 � 8 8  P u s h��    o      ���� 0 choicestext choicesText��  ��     9 : 9 l    ;���� ; r     < = < I   �� > ?
�� .gtqpchltns    @   @ ns   > o    ���� 0 choicestext choicesText ? �� @ A
�� 
prmp @ m     B B � C C 4 W h a t   w o u l d   y o u   l i k e   t o   d o ? A �� D��
�� 
inSL D J     E E  F�� F m     G G � H H $ P u l l ,   C o m m i t ,   P u s h��  ��   = o      ���� 0 choices  ��  ��   :  I J I l     ��������  ��  ��   J  K L K l     ��������  ��  ��   L  M N M l     ��������  ��  ��   N  O P O i      Q R Q I      ��������  0 pullcommitpush pullCommitPush��  ��   R k     + S S  T U T r      V W V n      X Y X 1   	 ��
�� 
ttxt Y l    	 Z���� Z I    	�� [ \
�� .sysodlogaskr        TEXT [ m      ] ] � ^ ^  C o m m i t   m e s s a g e \ �� _ `
�� 
dtxt _ m     a a � b b 2 A u t o m a t e d   c o m m i t   a n d   p u s h ` �� c��
�� 
givu c m    ���� x��  ��  ��   W o      ���� 0 	commitmsg 	commitMsg U  d e d r     f g f I   �� h��
�� .sysoexecTEXT���     TEXT h b     i j i b     k l k m     m m � n n � c d   ~ / p h p s t o r m p r o j e c t s / m y - p a g e   ;   e c h o   P u l l :   ;   g i t   p u l l   ;   e c h o   ;   g i t   a d d   - - a l l   ;   e c h o   C o m m i t :   ;   g i t   c o m m i t   - m   ' l o    ���� 0 	commitmsg 	commitMsg j m     o o � p p b '   ;   e c h o   ;   e c h o   P u s h :   ;   g i t   p u s h   - u   o r i g i n   m a s t e r��   g o      ���� 0 resultz   e  q�� q I   +�� r s
�� .sysodlogaskr        TEXT r b     t u t m     v v � w w " S c r i p t   r e s u l t s : 
 
 u o    ���� 0 resultz   s �� x y
�� 
btns x J    ! z z  {�� { m     | | � } }  O K��   y �� ~ 
�� 
dflt ~ m   " #����   �� ���
�� 
givu � m   $ %���� ��  ��   P  � � � l     ��������  ��  ��   �  � � � l     ��������  ��  ��   �  � � � i     � � � I      �������� 0 
pullcommit 
pullCommit��  ��   � k     + � �  � � � r      � � � n      � � � 1   	 ��
�� 
ttxt � l    	 ����� � I    	�� � �
�� .sysodlogaskr        TEXT � m      � � � � �  C o m m i t   m e s s a g e � �� � �
�� 
dtxt � m     � � � � � 2 A u t o m a t e d   c o m m i t   a n d   p u s h � �� ���
�� 
givu � m    ���� x��  ��  ��   � o      ���� 0 	commitmsg 	commitMsg �  � � � r     � � � I   �� ���
�� .sysoexecTEXT���     TEXT � b     � � � b     � � � m     � � � � � � c d   ~ / p h p s t o r m p r o j e c t s / m y - p a g e   ;   e c h o   P u l l :   ;   g i t   p u l l   ;   e c h o   ;   g i t   a d d   - - a l l   ;   e c h o   C o m m i t :   ;   g i t   c o m m i t   - m   ' � o    ���� 0 	commitmsg 	commitMsg � m     � � � � �  ' ; t r u e 
 	��   � o      ���� 0 resultz   �  ��� � I   +�� � �
�� .sysodlogaskr        TEXT � b     � � � m     � � � � � " S c r i p t   r e s u l t s : 
 
 � o    ���� 0 resultz   � �� � �
�� 
btns � J    ! � �  ��� � m     � � � � �  O K��   � �� � �
�� 
dflt � m   " #����  � �� ���
�� 
givu � m   $ %���� ��  ��   �  � � � l     ��������  ��  ��   �  � � � i     � � � I      �������� 0 
commitpush 
commitPush��  ��   � k     + � �  � � � r      � � � n      � � � 1   	 ��
�� 
ttxt � l    	 ����� � I    	�� � �
�� .sysodlogaskr        TEXT � m      � � � � �  C o m m i t   m e s s a g e � �� � �
�� 
dtxt � m     � � � � � 2 A u t o m a t e d   c o m m i t   a n d   p u s h � �� ���
�� 
givu � m    ���� x��  ��  ��   � o      ���� 0 	commitmsg 	commitMsg �  � � � r     � � � I   �� ���
�� .sysoexecTEXT���     TEXT � b     � � � b     � � � m     � � � � � � c d   ~ / p h p s t o r m p r o j e c t s / m y - p a g e   ;   g i t   a d d   - - a l l   ;   e c h o   C o m m i t :   ;   g i t   c o m m i t   - m   ' � o    ���� 0 	commitmsg 	commitMsg � m     � � � � � b '   ;   e c h o   ;   e c h o   P u s h :   ;   g i t   p u s h   - u   o r i g i n   m a s t e r��   � o      ���� 0 resultz   �  ��� � I   +�� � �
�� .sysodlogaskr        TEXT � b     � � � m     � � � � � " S c r i p t   r e s u l t s : 
 
 � o    ���� 0 resultz   � �� � �
�� 
btns � J    ! � �  ��� � m     � � � � �  O K��   � �� � �
�� 
dflt � m   " #����  � �� ���
�� 
givu � m   $ %���� ��  ��   �  � � � l     ��������  ��  ��   �  � � � i     � � � I      �������� 0 pullpush pullPush��  ��   � k      � �  � � � r      � � � I    �� ���
�� .sysoexecTEXT���     TEXT � m      � � � � � � c d   ~ / p h p s t o r m p r o j e c t s / m y - p a g e   ;   e c h o   P u l l :   ;   g i t   p u l l   ;   e c h o   ;   e c h o   P u s h :   ;   g i t   p u s h   - u   o r i g i n   m a s t e r��   � o      ���� 0 resultz   �  �� � I   �~ � �
�~ .sysodlogaskr        TEXT � b     � � � m    	 � � � � � " S c r i p t   r e s u l t s : 
 
 � o   	 
�}�} 0 resultz   � �| 
�| 
btns  J     �{ m     �  O K�{   �z
�z 
dflt m    �y�y  �x�w
�x 
givu m    �v�v �w  �   � 	
	 l     �u�t�s�u  �t  �s  
  l     �r�q�p�r  �q  �p    l     �o�n�m�o  �n  �m    i     I      �l�k�j�l 0 pull  �k  �j   k       r      I    �i�h
�i .sysoexecTEXT���     TEXT m      � j c d   ~ / p h p s t o r m p r o j e c t s / m y - p a g e   ;   e c h o   P u l l :   ;   g i t   p u l l�h   o      �g�g 0 resultz   �f I   �e
�e .sysodlogaskr        TEXT b     m    	   �!! " S c r i p t   r e s u l t s : 
 
 o   	 
�d�d 0 resultz   �c"#
�c 
btns" J    $$ %�b% m    && �''  O K�b  # �a()
�a 
dflt( m    �`�` ) �_*�^
�_ 
givu* m    �]�] �^  �f   +,+ l     �\�[�Z�\  �[  �Z  , -.- i    /0/ I      �Y�X�W�Y 
0 commit  �X  �W  0 k     +11 232 r     454 n     676 1   	 �V
�V 
ttxt7 l    	8�U�T8 I    	�S9:
�S .sysodlogaskr        TEXT9 m     ;; �<<  C o m m i t   m e s s a g e: �R=>
�R 
dtxt= m    ?? �@@ 2 A u t o m a t e d   c o m m i t   a n d   p u s h> �QA�P
�Q 
givuA m    �O�O x�P  �U  �T  5 o      �N�N 0 	commitmsg 	commitMsg3 BCB r    DED I   �MF�L
�M .sysoexecTEXT���     TEXTF b    GHG b    IJI m    KK �LL � c d   ~ / p h p s t o r m p r o j e c t s / m y - p a g e   ;   g i t   a d d   - - a l l   ;   e c h o   C o m m i t :   ;   g i t   c o m m i t   - m   'J o    �K�K 0 	commitmsg 	commitMsgH m    MM �NN  ' ; t r u e�L  E o      �J�J 0 resultz  C O�IO I   +�HPQ
�H .sysodlogaskr        TEXTP b    RSR m    TT �UU " S c r i p t   r e s u l t s : 
 
S o    �G�G 0 resultz  Q �FVW
�F 
btnsV J    !XX Y�EY m    ZZ �[[  O K�E  W �D\]
�D 
dflt\ m   " #�C�C ] �B^�A
�B 
givu^ m   $ %�@�@ �A  �I  . _`_ l     �?�>�=�?  �>  �=  ` aba i    cdc I      �<�;�:�< 0 push  �;  �:  d k     ee fgf r     hih I    �9j�8
�9 .sysoexecTEXT���     TEXTj m     kk �ll j c d   ~ / p h p s t o r m p r o j e c t s / m y - p a g e   ;   e c h o   P u s h :   ;   g i t   p u s h�8  i o      �7�7 0 resultz  g m�6m I   �5no
�5 .sysodlogaskr        TEXTn b    pqp m    	rr �ss " S c r i p t   r e s u l t s : 
 
q o   	 
�4�4 0 resultz  o �3tu
�3 
btnst J    vv w�2w m    xx �yy  O K�2  u �1z{
�1 
dfltz m    �0�0 { �/|�.
�/ 
givu| m    �-�- �.  �6  b }~} l     �,�+�*�,  �+  �*  ~ � l     �)�(�'�)  �(  �'  � ��� l     �&�%�$�&  �%  �$  � ��� l   -��#�"� Z    -���!� � =   !��� o    �� 0 choices  � J     �� ��� m    �� ��� $ P u l l ,   C o m m i t ,   P u s h�  � I   $ )����  0 pullcommitpush pullCommitPush�  �  �!  �   �#  �"  � ��� l     ����  �  �  � ��� l  . A���� Z   . A����� =  . 5��� o   . /�� 0 choices  � J   / 4�� ��� m   / 2�� ���  P u l l ,   C o m m i t�  � I   8 =���� 0 
pullcommit 
pullCommit�  �  �  �  �  �  � ��� l     ����  �  �  � ��� l  B U���
� Z   B U���	�� =  B I��� o   B C�� 0 choices  � J   C H�� ��� m   C F�� ���  C o m m i t ,   P u s h�  � I   L Q���� 0 
commitpush 
commitPush�  �  �	  �  �  �
  � ��� l     ��� �  �  �   � ��� l  V i������ Z   V i������� =  V ]��� o   V W���� 0 choices  � J   W \�� ���� m   W Z�� ���  P u l l ,   P u s h��  � I   ` e�������� 0 pullpush pullPush��  ��  ��  ��  ��  ��  � ��� l     ��������  ��  ��  � ��� l  j }������ Z   j }������� =  j q��� o   j k���� 0 choices  � J   k p�� ���� m   k n�� ���  P u l l��  � I   t y�������� 0 pull  ��  ��  ��  ��  ��  ��  � ��� l     ��������  ��  ��  � ��� l  ~ ������� Z   ~ �������� =  ~ ���� o   ~ ���� 0 choices  � J    ��� ���� m    ��� ���  C o m m i t��  � I   � ��������� 
0 commit  ��  ��  ��  ��  ��  ��  � ��� l     ��������  ��  ��  � ��� l  � ������� Z   � �������� =  � ���� o   � ����� 0 choices  � J   � ��� ���� m   � ��� ���  P u s h��  � I   � ��������� 0 push  ��  ��  ��  ��  ��  ��  � ��� l     ��������  ��  ��  � ���� l     ��������  ��  ��  ��       
�������������  � ������������������  0 pullcommitpush pullCommitPush�� 0 
pullcommit 
pullCommit�� 0 
commitpush 
commitPush�� 0 pullpush pullPush�� 0 pull  �� 
0 commit  �� 0 push  
�� .aevtoappnull  �   � ****� �� R����������  0 pullcommitpush pullCommitPush��  ��  � ������ 0 	commitmsg 	commitMsg�� 0 resultz  �  ]�� a���������� m o�� v�� |������
�� 
dtxt
�� 
givu�� x�� 
�� .sysodlogaskr        TEXT
�� 
ttxt
�� .sysoexecTEXT���     TEXT
�� 
btns
�� 
dflt�� �� �� ,������ �,E�O�%�%j 
E�O�%��kv�k��a  � �� ����������� 0 
pullcommit 
pullCommit��  ��  � ������ 0 	commitmsg 	commitMsg�� 0 resultz  �  ��� ����������� � ��� ��� �������
�� 
dtxt
�� 
givu�� x�� 
�� .sysodlogaskr        TEXT
�� 
ttxt
�� .sysoexecTEXT���     TEXT
�� 
btns
�� 
dflt�� �� �� ,������ �,E�O�%�%j 
E�O�%��kv�k��a  � �� ����������� 0 
commitpush 
commitPush��  ��  � ������ 0 	commitmsg 	commitMsg�� 0 resultz  �  ��� ����������� � ��� ��� �������
�� 
dtxt
�� 
givu�� x�� 
�� .sysodlogaskr        TEXT
�� 
ttxt
�� .sysoexecTEXT���     TEXT
�� 
btns
�� 
dflt�� �� �� ,������ �,E�O�%�%j 
E�O�%��kv�k��a  � �� ����������� 0 pullpush pullPush��  ��  � ���� 0 resultz  � 
 ��� �������������
�� .sysoexecTEXT���     TEXT
�� 
btns
�� 
dflt
�� 
givu�� �� 
�� .sysodlogaskr        TEXT�� �j E�O�%��kv�k��� 	� ������������ 0 pull  ��  ��  � �� 0 resultz  � 
�~ �}&�|�{�z�y�x
�~ .sysoexecTEXT���     TEXT
�} 
btns
�| 
dflt
�{ 
givu�z �y 
�x .sysodlogaskr        TEXT�� �j E�O�%��kv�k��� 	� �w0�v�u���t�w 
0 commit  �v  �u  � �s�r�s 0 	commitmsg 	commitMsg�r 0 resultz  � ;�q?�p�o�n�m�lKM�kT�jZ�i�h�g
�q 
dtxt
�p 
givu�o x�n 
�m .sysodlogaskr        TEXT
�l 
ttxt
�k .sysoexecTEXT���     TEXT
�j 
btns
�i 
dflt�h �g �t ,������ �,E�O�%�%j 
E�O�%��kv�k��a  � �fd�e�d���c�f 0 push  �e  �d  � �b�b 0 resultz  � 
k�ar�`x�_�^�]�\�[
�a .sysoexecTEXT���     TEXT
�` 
btns
�_ 
dflt
�^ 
givu�] �\ 
�[ .sysodlogaskr        TEXT�c �j E�O�%��kv�k��� 	� �Z��Y�X���W
�Z .aevtoappnull  �   � ****� k     ���  ��  9�� ��� ��� ��� ��� �   � ��V�V  �Y  �X  �  �    $ ( , 0 4 7�U�T�S B�R G�Q�P�O��N��M��L��K��J��I��H�U �T 0 choicestext choicesText
�S 
prmp
�R 
inSL�Q 
�P .gtqpchltns    @   @ ns  �O 0 choices  �N  0 pullcommitpush pullCommitPush�M 0 
pullcommit 
pullCommit�L 0 
commitpush 
commitPush�K 0 pullpush pullPush�J 0 pull  �I 
0 commit  �H 0 push  �W ���������vE�O�����kv� E�O�a kv  
*j+ Y hO�a kv  
*j+ Y hO�a kv  
*j+ Y hO�a kv  
*j+ Y hO�a kv  
*j+ Y hO�a kv  
*j+ Y hO�a kv  
*j+ Y h ascr  ��ޭ