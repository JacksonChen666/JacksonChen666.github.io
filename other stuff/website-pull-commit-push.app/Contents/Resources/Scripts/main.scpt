FasdUAS 1.101.10   ��   ��    k             l     ��  ��     V1     � 	 	  V 1   
  
 l      ��  ��   script pullCommitPush	set commitMsg to text returned of (display dialog "Commit message" default answer "Automated commit and push" giving up after 120)		set resultz to do shell script "cd ~/phpstormprojects/my-page ; echo Pull: ; git pull ; echo ; git add --all ; echo Commit: ; git commit -m '" & commitMsg & "' ; echo ; echo Push: ; git push -u origin master"		display dialog "Script results:\n\n" & resultz buttons {"OK"} default button 1 giving up after 15end scriptset choicing to button returned of (display dialog "Would you like to pull, commit, and push?" buttons {"Cancel", "No", "Yes"} default button 3)if choicing is "Yes" then	tell pullCommitPush to runend ifif choicing is "No" then	tell asks to runend ifscript commitOrPush	set choices to button returned of (display dialog "What would you like to do?" buttons {"Cancel", "Commit", "Push"} default button 2)		if choices is "Commit" then		set commitMsg to text returned of (display dialog "Commit message" default answer "Automated commit and push" giving up after 120)		set resultz to do shell script "cd ~/phpstormprojects/my-page ; git add --all ; echo Commit: ; git commit -m '" & commitMsg & "'"		display dialog "Script results:\n\n" & resultz buttons {"OK"} default button 1 giving up after 15	end if		if choices is "Push" then		set resultz to do shell script "cd ~/phpstormprojects/my-page ; echo Push: ; git push -u origin master"		display dialog "Script results:\n\n" & resultz buttons {"OK"} default button 1 giving up after 15	end if	end scriptscript pull	set resultz to do shell script "cd ~/phpstormprojects/my-page ; echo Pull: ; git pull"	display dialog "Script results:\n\n" & resultz buttons {"OK"} default button 1 giving up after 15end scriptscript asks	set choices to button returned of (display dialog "What would you like to do?" buttons {"Cancel", "Pull", "Commit or push"} default button 3)		if choices is "Pull" then		tell pull to run	end if		if choices is "Commit or push" then		tell commitOrPush to run	end if	end script     �   s c r i p t   p u l l C o m m i t P u s h  	 s e t   c o m m i t M s g   t o   t e x t   r e t u r n e d   o f   ( d i s p l a y   d i a l o g   " C o m m i t   m e s s a g e "   d e f a u l t   a n s w e r   " A u t o m a t e d   c o m m i t   a n d   p u s h "   g i v i n g   u p   a f t e r   1 2 0 )  	  	 s e t   r e s u l t z   t o   d o   s h e l l   s c r i p t   " c d   ~ / p h p s t o r m p r o j e c t s / m y - p a g e   ;   e c h o   P u l l :   ;   g i t   p u l l   ;   e c h o   ;   g i t   a d d   - - a l l   ;   e c h o   C o m m i t :   ;   g i t   c o m m i t   - m   ' "   &   c o m m i t M s g   &   " '   ;   e c h o   ;   e c h o   P u s h :   ;   g i t   p u s h   - u   o r i g i n   m a s t e r "  	  	 d i s p l a y   d i a l o g   " S c r i p t   r e s u l t s : \ n \ n "   &   r e s u l t z   b u t t o n s   { " O K " }   d e f a u l t   b u t t o n   1   g i v i n g   u p   a f t e r   1 5  e n d   s c r i p t   s e t   c h o i c i n g   t o   b u t t o n   r e t u r n e d   o f   ( d i s p l a y   d i a l o g   " W o u l d   y o u   l i k e   t o   p u l l ,   c o m m i t ,   a n d   p u s h ? "   b u t t o n s   { " C a n c e l " ,   " N o " ,   " Y e s " }   d e f a u l t   b u t t o n   3 )   i f   c h o i c i n g   i s   " Y e s "   t h e n  	 t e l l   p u l l C o m m i t P u s h   t o   r u n  e n d   i f   i f   c h o i c i n g   i s   " N o "   t h e n  	 t e l l   a s k s   t o   r u n  e n d   i f   s c r i p t   c o m m i t O r P u s h  	 s e t   c h o i c e s   t o   b u t t o n   r e t u r n e d   o f   ( d i s p l a y   d i a l o g   " W h a t   w o u l d   y o u   l i k e   t o   d o ? "   b u t t o n s   { " C a n c e l " ,   " C o m m i t " ,   " P u s h " }   d e f a u l t   b u t t o n   2 )  	  	 i f   c h o i c e s   i s   " C o m m i t "   t h e n  	 	 s e t   c o m m i t M s g   t o   t e x t   r e t u r n e d   o f   ( d i s p l a y   d i a l o g   " C o m m i t   m e s s a g e "   d e f a u l t   a n s w e r   " A u t o m a t e d   c o m m i t   a n d   p u s h "   g i v i n g   u p   a f t e r   1 2 0 )  	 	 s e t   r e s u l t z   t o   d o   s h e l l   s c r i p t   " c d   ~ / p h p s t o r m p r o j e c t s / m y - p a g e   ;   g i t   a d d   - - a l l   ;   e c h o   C o m m i t :   ;   g i t   c o m m i t   - m   ' "   &   c o m m i t M s g   &   " ' "  	 	 d i s p l a y   d i a l o g   " S c r i p t   r e s u l t s : \ n \ n "   &   r e s u l t z   b u t t o n s   { " O K " }   d e f a u l t   b u t t o n   1   g i v i n g   u p   a f t e r   1 5  	 e n d   i f  	  	 i f   c h o i c e s   i s   " P u s h "   t h e n  	 	 s e t   r e s u l t z   t o   d o   s h e l l   s c r i p t   " c d   ~ / p h p s t o r m p r o j e c t s / m y - p a g e   ;   e c h o   P u s h :   ;   g i t   p u s h   - u   o r i g i n   m a s t e r "  	 	 d i s p l a y   d i a l o g   " S c r i p t   r e s u l t s : \ n \ n "   &   r e s u l t z   b u t t o n s   { " O K " }   d e f a u l t   b u t t o n   1   g i v i n g   u p   a f t e r   1 5  	 e n d   i f  	  e n d   s c r i p t   s c r i p t   p u l l  	 s e t   r e s u l t z   t o   d o   s h e l l   s c r i p t   " c d   ~ / p h p s t o r m p r o j e c t s / m y - p a g e   ;   e c h o   P u l l :   ;   g i t   p u l l "  	 d i s p l a y   d i a l o g   " S c r i p t   r e s u l t s : \ n \ n "   &   r e s u l t z   b u t t o n s   { " O K " }   d e f a u l t   b u t t o n   1   g i v i n g   u p   a f t e r   1 5  e n d   s c r i p t   s c r i p t   a s k s  	 s e t   c h o i c e s   t o   b u t t o n   r e t u r n e d   o f   ( d i s p l a y   d i a l o g   " W h a t   w o u l d   y o u   l i k e   t o   d o ? "   b u t t o n s   { " C a n c e l " ,   " P u l l " ,   " C o m m i t   o r   p u s h " }   d e f a u l t   b u t t o n   3 )  	  	 i f   c h o i c e s   i s   " P u l l "   t h e n  	 	 t e l l   p u l l   t o   r u n  	 e n d   i f  	  	 i f   c h o i c e s   i s   " C o m m i t   o r   p u s h "   t h e n  	 	 t e l l   c o m m i t O r P u s h   t o   r u n  	 e n d   i f  	  e n d   s c r i p t      l     ��������  ��  ��        l     ��  ��     V2     �    V 2      l     ��������  ��  ��        i         I      ��������  0 pullcommitpush pullCommitPush��  ��    k     +       r          n      ! " ! 1   	 ��
�� 
ttxt " l    	 #���� # I    	�� $ %
�� .sysodlogaskr        TEXT $ m      & & � ' '  C o m m i t   m e s s a g e % �� ( )
�� 
dtxt ( m     * * � + + 2 A u t o m a t e d   c o m m i t   a n d   p u s h ) �� ,��
�� 
givu , m    ���� x��  ��  ��     o      ���� 0 	commitmsg 	commitMsg   - . - r     / 0 / I   �� 1��
�� .sysoexecTEXT���     TEXT 1 b     2 3 2 b     4 5 4 m     6 6 � 7 7 � c d   ~ / p h p s t o r m p r o j e c t s / m y - p a g e   ;   e c h o   P u l l :   ;   g i t   p u l l   ;   e c h o   ;   g i t   a d d   - - a l l   ;   e c h o   C o m m i t :   ;   g i t   c o m m i t   - m   ' 5 o    ���� 0 	commitmsg 	commitMsg 3 m     8 8 � 9 9 b '   ;   e c h o   ;   e c h o   P u s h :   ;   g i t   p u s h   - u   o r i g i n   m a s t e r��   0 o      ���� 0 resultz   .  :�� : I   +�� ; <
�� .sysodlogaskr        TEXT ; b     = > = m     ? ? � @ @ " S c r i p t   r e s u l t s : 
 
 > o    ���� 0 resultz   < �� A B
�� 
btns A J    ! C C  D�� D m     E E � F F  O K��   B �� G H
�� 
dflt G m   " #����  H �� I��
�� 
givu I m   $ %���� ��  ��     J K J l     ��������  ��  ��   K  L M L l     ��������  ��  ��   M  N O N i     P Q P I      �������� 0 
pullcommit 
pullCommit��  ��   Q k     + R R  S T S r      U V U n      W X W 1   	 ��
�� 
ttxt X l    	 Y���� Y I    	�� Z [
�� .sysodlogaskr        TEXT Z m      \ \ � ] ]  C o m m i t   m e s s a g e [ �� ^ _
�� 
dtxt ^ m     ` ` � a a 2 A u t o m a t e d   c o m m i t   a n d   p u s h _ �� b��
�� 
givu b m    ���� x��  ��  ��   V o      ���� 0 	commitmsg 	commitMsg T  c d c r     e f e I   �� g��
�� .sysoexecTEXT���     TEXT g b     h i h b     j k j m     l l � m m � c d   ~ / p h p s t o r m p r o j e c t s / m y - p a g e   ;   e c h o   P u l l :   ;   g i t   p u l l   ;   e c h o   ;   g i t   a d d   - - a l l   ;   e c h o   C o m m i t :   ;   g i t   c o m m i t   - m   ' k o    ���� 0 	commitmsg 	commitMsg i m     n n � o o  ' ; t r u e 
 	��   f o      ���� 0 resultz   d  p�� p I   +�� q r
�� .sysodlogaskr        TEXT q b     s t s m     u u � v v " S c r i p t   r e s u l t s : 
 
 t o    ���� 0 resultz   r �� w x
�� 
btns w J    ! y y  z�� z m     { { � | |  O K��   x �� } ~
�� 
dflt } m   " #����  ~ �� ��
�� 
givu  m   $ %���� ��  ��   O  � � � l     ��������  ��  ��   �  � � � i     � � � I      �������� 0 
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
�� .sysoexecTEXT���     TEXT � m      � � � � � � c d   ~ / p h p s t o r m p r o j e c t s / m y - p a g e   ;   e c h o   P u l l :   ;   g i t   p u l l   ;   e c h o   ;   e c h o   P u s h :   ;   g i t   p u s h   - u   o r i g i n   m a s t e r��   � o      ���� 0 resultz   �  ��� � I   �� � �
�� .sysodlogaskr        TEXT � b     � � � m    	 � � � � � " S c r i p t   r e s u l t s : 
 
 � o   	 
���� 0 resultz   � �� � �
�� 
btns � J     � �  ��� � m     � � � � �  O K��   � �� � �
�� 
dflt � m    ����  � �� ���
�� 
givu � m    ���� ��  ��   �  � � � l     ��������  ��  ��   �  � � � l     ��������  ��  ��   �  � � � l     ��������  ��  ��   �  � � � i     � � � I      �������� 0 pull  ��  ��   � k      � �  � � � r      � � � I    � ��~
� .sysoexecTEXT���     TEXT � m      � � � � � j c d   ~ / p h p s t o r m p r o j e c t s / m y - p a g e   ;   e c h o   P u l l :   ;   g i t   p u l l�~   � o      �}�} 0 resultz   �  ��| � I   �{ � �
�{ .sysodlogaskr        TEXT � b     � � � m    	 � � � � � " S c r i p t   r e s u l t s : 
 
 � o   	 
�z�z 0 resultz   � �y � �
�y 
btns � J     � �  ��x � m     � � � � �  O K�x   � �w � �
�w 
dflt � m    �v�v  � �u ��t
�u 
givu � m    �s�s �t  �|   �  � � � l     �r�q�p�r  �q  �p   �  � � � i     � � � I      �o�n�m�o 
0 commit  �n  �m   � k     + � �  � � � r      � � � n      �  � 1   	 �l
�l 
ttxt  l    	�k�j I    	�i
�i .sysodlogaskr        TEXT m      �  C o m m i t   m e s s a g e �h
�h 
dtxt m     �		 2 A u t o m a t e d   c o m m i t   a n d   p u s h �g
�f
�g 
givu
 m    �e�e x�f  �k  �j   � o      �d�d 0 	commitmsg 	commitMsg �  r     I   �c�b
�c .sysoexecTEXT���     TEXT b     b     m     � � c d   ~ / p h p s t o r m p r o j e c t s / m y - p a g e   ;   g i t   a d d   - - a l l   ;   e c h o   C o m m i t :   ;   g i t   c o m m i t   - m   ' o    �a�a 0 	commitmsg 	commitMsg m     �  ' ; t r u e�b   o      �`�` 0 resultz   �_ I   +�^
�^ .sysodlogaskr        TEXT b     m     � " S c r i p t   r e s u l t s : 
 
 o    �]�] 0 resultz   �\ 
�\ 
btns J    !!! "�[" m    ## �$$  O K�[    �Z%&
�Z 
dflt% m   " #�Y�Y & �X'�W
�X 
givu' m   $ %�V�V �W  �_   � ()( l     �U�T�S�U  �T  �S  ) *+* i    ,-, I      �R�Q�P�R 0 push  �Q  �P  - k     .. /0/ r     121 I    �O3�N
�O .sysoexecTEXT���     TEXT3 m     44 �55 � c d   ~ / p h p s t o r m p r o j e c t s / m y - p a g e   ;   e c h o   P u s h :   ;   g i t   p u s h   - u   o r i g i n   m a s t e r�N  2 o      �M�M 0 resultz  0 6�L6 I   �K78
�K .sysodlogaskr        TEXT7 b    9:9 m    	;; �<< " S c r i p t   r e s u l t s : 
 
: o   	 
�J�J 0 resultz  8 �I=>
�I 
btns= J    ?? @�H@ m    AA �BB  O K�H  > �GCD
�G 
dfltC m    �F�F D �EE�D
�E 
givuE m    �C�C �D  �L  + FGF l     �B�A�@�B  �A  �@  G H�?H l    �I�>�=I T     �JJ k    �KK LML r    NON J    PP QRQ m    SS �TT $ P u l l ,   C o m m i t ,   P u s hR UVU m    WW �XX  P u l l ,   C o m m i tV YZY m    [[ �\\  C o m m i t ,   P u s hZ ]^] m    	__ �``  P u l l ,   P u s h^ aba m   	 
cc �dd  P u l lb efe m   
 gg �hh  C o m m i tf iji m    kk �ll  P u s hj m�<m m    nn �oo  C a n c e l�<  O o      �;�; 0 choicestext choicesTextM pqp r    !rsr I   �:tu
�: .gtqpchltns    @   @ ns  t o    �9�9 0 choicestext choicesTextu �8vw
�8 
prmpv m    xx �yy 4 W h a t   w o u l d   y o u   l i k e   t o   d o ?w �7z�6
�7 
inSLz J    {{ |�5| m    }} �~~ $ P u l l ,   C o m m i t ,   P u s h�5  �6  s o      �4�4 0 choices  q � l  " "�3�2�1�3  �2  �1  � ��� Z   " 7���0�/� =  " +��� o   " %�.�. 0 choices  � J   % *�� ��-� m   % (�� ��� $ P u l l ,   C o m m i t ,   P u s h�-  � I   . 3�,�+�*�,  0 pullcommitpush pullCommitPush�+  �*  �0  �/  � ��� l  8 8�)�(�'�)  �(  �'  � ��� Z   8 M���&�%� =  8 A��� o   8 ;�$�$ 0 choices  � J   ; @�� ��#� m   ; >�� ���  P u l l ,   C o m m i t�#  � I   D I�"�!� �" 0 
pullcommit 
pullCommit�!  �   �&  �%  � ��� l  N N����  �  �  � ��� Z   N c����� =  N W��� o   N Q�� 0 choices  � J   Q V�� ��� m   Q T�� ���  C o m m i t ,   P u s h�  � I   Z _���� 0 
commitpush 
commitPush�  �  �  �  � ��� l  d d����  �  �  � ��� Z   d y����� =  d m��� o   d g�� 0 choices  � J   g l�� ��� m   g j�� ���  P u l l ,   P u s h�  � I   p u���� 0 pullpush pullPush�  �  �  �  � ��� l  z z��
�	�  �
  �	  � ��� Z   z ������ =  z ���� o   z }�� 0 choices  � J   } ��� ��� m   } ��� ���  P u l l�  � I   � ����� 0 pull  �  �  �  �  � ��� l  � ��� ���  �   ��  � ��� Z   � �������� =  � ���� o   � ����� 0 choices  � J   � ��� ���� m   � ��� ���  C o m m i t��  � I   � ��������� 
0 commit  ��  ��  ��  ��  � ��� l  � ���������  ��  ��  � ��� Z   � �������� =  � ���� o   � ����� 0 choices  � J   � ��� ���� m   � ��� ���  P u s h��  � I   � ��������� 0 push  ��  ��  ��  ��  � ��� l  � ���������  ��  ��  � ���� Z   � �������� =  � ���� o   � ����� 0 choices  � J   � ��� ���� m   � ��� ���  C a n c e l��  � R   � ������
�� .ascrerr ****      � ****��  � �����
�� 
errn� m   � ���������  ��  ��  ��  �>  �=  �?       ���������������������������  � ����������������������������������  0 pullcommitpush pullCommitPush�� 0 
pullcommit 
pullCommit�� 0 
commitpush 
commitPush�� 0 pullpush pullPush�� 0 pull  �� 
0 commit  �� 0 push  
�� .aevtoappnull  �   � ****�� 0 choicestext choicesText�� 0 choices  ��  ��  ��  ��  ��  ��  � �� ����������  0 pullcommitpush pullCommitPush��  ��  � ������ 0 	commitmsg 	commitMsg�� 0 resultz  �  &�� *���������� 6 8�� ?�� E������
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
E�O�%��kv�k��a  � �� Q���������� 0 
pullcommit 
pullCommit��  ��  � ������ 0 	commitmsg 	commitMsg�� 0 resultz  �  \�� `���������� l n�� u�� {������
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
 ��� ��� �����������
�� .sysoexecTEXT���     TEXT
�� 
btns
�� 
dflt
�� 
givu�� �� 
�� .sysodlogaskr        TEXT�� �j E�O�%��kv�k��� 	� �� ����������� 0 pull  ��  ��  � ���� 0 resultz  � 
 ��� ��� ����������
�� .sysoexecTEXT���     TEXT
�� 
btns
�� 
dflt
�� 
givu�� �� 
� .sysodlogaskr        TEXT�� �j E�O�%��kv�k��� 	� �~ ��}�|���{�~ 
0 commit  �}  �|  � �z�y�z 0 	commitmsg 	commitMsg�y 0 resultz  � �x�w�v�u�t�s�r�q#�p�o�n
�x 
dtxt
�w 
givu�v x�u 
�t .sysodlogaskr        TEXT
�s 
ttxt
�r .sysoexecTEXT���     TEXT
�q 
btns
�p 
dflt�o �n �{ ,������ �,E�O�%�%j 
E�O�%��kv�k��a  � �m-�l�k���j�m 0 push  �l  �k  � �i�i 0 resultz  � 
4�h;�gA�f�e�d�c�b
�h .sysoexecTEXT���     TEXT
�g 
btns
�f 
dflt
�e 
givu�d �c 
�b .sysodlogaskr        TEXT�j �j E�O�%��kv�k��� 	� �a��`�_���^
�a .aevtoappnull  �   � ****� k     ��� H�]�]  �`  �_  �  � "SW[_cgkn�\�[�Zx�Y}�X�W�V��U��T��S��R��Q��P��O��N�M�\ �[ 0 choicestext choicesText
�Z 
prmp
�Y 
inSL�X 
�W .gtqpchltns    @   @ ns  �V 0 choices  �U  0 pullcommitpush pullCommitPush�T 0 
pullcommit 
pullCommit�S 0 
commitpush 
commitPush�R 0 pullpush pullPush�Q 0 pull  �P 
0 commit  �O 0 push  
�N 
errn�M���^ � �hZ���������vE�O�����kv� E` O_ a kv  
*j+ Y hO_ a kv  
*j+ Y hO_ a kv  
*j+ Y hO_ a kv  
*j+ Y hO_ a kv  
*j+ Y hO_ a kv  
*j+ Y hO_ a kv  
*j+ Y hO_ a kv  )a  a !lhY h[OY�+� �L��L �  SW[_cgkn� �K��K �  �� �    C a n c e l��  ��  ��  ��  ��  ��   ascr  ��ޭ