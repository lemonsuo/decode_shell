#!/bin/bash
#
# Encrypted by Rangga Fajar Oktariansyah (Anak Gabut Thea)
#
# This file has been encrypted with BZip2 Shell Exec <https://github.com/FajarKim/bz2-shell>
# The filename '1CFwarp.sh' encrypted at Fri Nov  1 09:41:23 UTC 2024
# I try invoking the compressed executable with the original name
# (for programs looking at their name).  We also try to retain the original
# file permissions on the compressed file.  For safety reasons, bzsh will
# not create setuid or setgid shell scripts.
#
# WARNING: the first line of this file must be either : or #!/bin/bash
# The : is required for some old versions of csh.
# On Ultrix, /bin/bash is too buggy, change the first line to: #!/bin/bash5
#
# Don't forget to follow me on <https://github.com/FajarKim>
skip=75

tab='	'
nl='
'
IFS=" $tab$nl"

# Make sure important variables exist if not already defined
# $USER is defined by login(1) which is not always executed (e.g. containers)
# POSIX: https://pubs.opengroup.org/onlinepubs/009695299/utilities/id.html
USER=${USER:-$(id -u -n)}
# $HOME is defined at the time of login, but it could be unset. If it is unset,
# a tilde by itself (~) will not be expanded to the current user's home directory.
# POSIX: https://pubs.opengroup.org/onlinepubs/009696899/basedefs/xbd_chap08.html#tag_08_03
HOME="${HOME:-$(getent passwd $USER 2>/dev/null | cut -d: -f6)}"
# macOS does not have getent, but this works even if $HOME is unset
HOME="${HOME:-$(eval echo ~$USER)}"
umask=`umask`
umask 77

bztmpdir=
trap 'res=$?
  test -n "$bztmpdir" && rm -fr "$bztmpdir"
  (exit $res); exit $res
' 0 1 2 3 5 10 13 15

case $TMPDIR in
  / | */tmp/) test -d "$TMPDIR" && test -w "$TMPDIR" && test -x "$TMPDIR" || TMPDIR=$HOME/.cache/; test -d "$HOME/.cache" && test -w "$HOME/.cache" && test -x "$HOME/.cache" || mkdir "$HOME/.cache";;
  */tmp) TMPDIR=$TMPDIR/; test -d "$TMPDIR" && test -w "$TMPDIR" && test -x "$TMPDIR" || TMPDIR=$HOME/.cache/; test -d "$HOME/.cache" && test -w "$HOME/.cache" && test -x "$HOME/.cache" || mkdir "$HOME/.cache";;
  *:* | *) TMPDIR=$HOME/.cache/; test -d "$HOME/.cache" && test -w "$HOME/.cache" && test -x "$HOME/.cache" || mkdir "$HOME/.cache";;
esac
if type mktemp >/dev/null 2>&1; then
  bztmpdir=`mktemp -d "${TMPDIR}bztmpXXXXXXXXX"`
else
  bztmpdir=${TMPDIR}bztmp$$; mkdir $bztmpdir
fi || { (exit 127); exit 127; }

bztmp=$bztmpdir/$0
case $0 in
-* | */*'
') mkdir -p "$bztmp" && rm -r "$bztmp";;
*/*) bztmp=$bztmpdir/`basename "$0"`;;
esac || { (exit 127); exit 127; }

case `printf 'X\n' | tail -n +1 2>/dev/null` in
X) tail_n=-n;;
*) tail_n=;;
esac
if tail $tail_n +$skip <"$0" | bzip2 -cd > "$bztmp"; then
  umask $umask
  chmod 700 "$bztmp"
  (sleep 5; rm -fr "$bztmpdir") 2>/dev/null &
  "$bztmp" ${1+"$@"}; res=$?
else
  printf >&2 '%s\n' "Cannot decompress ${0##*/}"
  printf >&2 '%s\n' "Report bugs to <fajarrkim@gmail.com>."
  (exit 127); res=127
fi; exit $res
BZh91AY&SY�J? C������������������������S���}=4}:����]��^��3f�}Z���^{�y=�.��
��{�G��]�n��U�/�޶����ͽ���r��/I����7��y����l>�v���^[:�X[f��iۉ݊	l�6�ji���Ic}�eR-��KY.�D�&�N�-d)�{���E��]�T�U"�ET��8�t�j��{`4�!$�F� `F@56LѤ�a2�i�xP�D�����#��G��A�4  I �@���T����S�E20��4������jd6��@d  �  �4(I2R���~���6��A�i�@� 4�dh2��F@      I�jh�L&MM�O���mL�O$d�<(hzF@���4���@ C@ i�4JM��b���� i��1Ojh(�&Ч��O)�oSi'����P��A�P=@h�PD��&�4 MLi56�=)�=Sz<I�&��ɦ�444�@ F��  2�tΞ�TQ9F��2iP�)�*������H"@P���:�D4!�V!�}%!z��aIL?#�	��<K�Q\H�&I���Ò6�E�,�X�����v(�G?76�`�n鄊Yn�v���J�����h����{1��&Y'�S/�u]�X�)Cq-�/MO��n���1~��rڙ9b�}uzj}(�vu[k5X&qq�u�CN�nS(� ���!�#�ǒ̶U0��0��"�����Y�ֿԉSߑ�N�T]ö��3��g���#=]hӮ��e��Zj��/ҔH4��>Q��o�RI˓���=�iۉߵ��4M�I$^�LS\�n�ؖ��s��Y����r��O�HO��{�NNU��#p���!͒~�9�Y̧��� ;#c#�����s\�C������������66�*�=OE.��&zY���䶩s%ڹ�O,L�T91Y�8��8e���}�<�],�r���~�Zb���Y8��P��o��!Í�ƙek��[�:9
��8�
�U�uq3�v�\��'�q3lG�:�	����Uq�_�c�J����b�K�}�j��������S��و��t���׻�MZ�3@Ъ��QF���}=�-���@�wC���WŬ���P���f��j��
��SA�*���5��k�5�M��7i\� \3ag2�5�zz_m�quA��u�k�v,��Ea	�`1�!�������Y{ȥ�R����R�CK��]�b<t�A�^Q�E��Yd������AH�|�V��{qX�h��)o�gyǕ�n��KdZ�b���������P���	�Ĕ�J^���%&��خ�iqWy!e��r�'{�� c{3���jUEn�"X�ɓ(5�
Ǯ�]|ʰ���h�3$��M�{�ݦ�R;��n�n���(81��͹�rwK��ެe}ooBqv<s~,�y�p,�x�-�jIfd=���;0/E��46Ĵ/C����b$,X$��H#��T6�0l1�G*i�0`7D2l����,�v1���)E./�� >��'Az�4c�ﾋj0J�2 |��& Bm��s>�0	�}�g*#
�dD1��oD ��(�"�λ_Pʄ(TZ���-6��T� � L�;�Ak,X-�B�>~�a�l�(C��gHCi�.%Ҝ��QuW����U����Ã"�(���L�v�g��0/(9�HX"��x�qņ����2�.�PU-�tmf�
�D%)Kj��r���=��� ���Ih�T�[$#�W� �~�`m��nf����T�C���i��3L�Z5 ��8�P'I@��ܝ�`U���1�?aY��\OÚܘ�o���@
��`VD
'���F�ަ�R)�� y$�B�d�x鳊���`�nA.3fT7��~3��G�Cy����4|������(����M0�=�V!!U�u��sJ��<���$3�e+�t4��C�`d��zQ��v����pr��ya�KjMM���*:.��TV*]$�Y��-��{)��K�4O���2x4x�[7��]�UUV���;�ͦj��� ���s)��F�p�4��:=��%���5����(^w|��Y2*��(��<m��H�����|��BSL&!�00TuKT/ed�hI�D2�DӰ���@��lu����1&�qJO�����/Z rAv'�����31�(��9-J$��F����&��*0k|����a@)���|�77N�`Xs���	yA5�l^p�ũ@2�����@���O��---\kwe�f��+R�����r��q��W�B��c�"�|�< �(.Զ�	'�Nq-S��`# �ԁ�E���+�:)B�to��ډ��+�X�k�Dˀ����&�$�bQk�j����4�K1b���AfL=12Xb�X��N.r��(�Vs�uYh�)��k.D�.��R��AA9��\��U�(՘S`:�38�^c������Q�-)-@�M����mx��^f1�ؔ�J��l.,7�p��rS��n����R�Kލ�E�Z�!���2v�&�XG�	�(��\�<� b	��L�����ZMym;6l��v�D$D����+�@�a����Tx.�\�&���F�m����HȐ>%)B)B��qA`�ѹ�|>9��()�k" s�qQ��[�/�����(�=������R�������7y��	.e�(Db$曔v�K Y$_�F�B!�J:�F@b�yM|�Q	�Zr5��:��cʥ���VT2����g�ait��hf��00�I%�ͥ���	F��6�͟B~�M��	>�`I�!�`d<�ozWi�%
0�|'�8K�P��3����!�@YXaG(��?�z��7h��FAI�Y�S���5�܎%�1��T@��	hs�!d�7�=����G�O<5�ĐL� A� ��;;7��63�L�}��q����1l����v��h��]�#z����Y:t�=i��ۜ�ِ�b)O�"��#~�ղ,6�L���� ���Ҷ)�s��\V�m�^�`������5�[���
���T��94֛!(���	�^v��]�N6��4nk��6ܗOD���E����u�a��4���
��Bb��xf�����Ӕi������T��4���m �bD��Dȋ�0S�׹�:�O|�D�$#�U9B���R�ᦅ���>�ǆtT�ZZZ�m5��!m��q;��t�1�Ί]��b� ��L|�2��15� ���1����v�T�eۺяw7�pa�4T#Q���.<B���b�e�A� @�yH���|L��	J�N}#JYE�׆�4���-�~��**��hq��=��P��^$�m�P,q��fU��wy/ �b
N��P���H�AV��kUM4���d3L�D��+F��BD��{�yj��pv-F�a����K�=���7_�):�\�8�HMCOC�r���r��h҆��"�ٴ�0 �$�0i�۫�%�3��Ŷ%H� :�N�n2��l�!�Ƣ6,���]�,��{S����5�o��ػq��Ý���1
!�L=l��Ma�$0�$�X�wd�yF��yf� ������'w�O\=qȁ����=�0>����c��B���N��N�-���\2��Xw3���(�?��)����=�k���c�_O����
�&�Y6�^_�Ž��:,Â!�[{���ҿI�7�����"��|��}���EǨ���CU~;5>�zsɱ1�r������'4���\���bi�HlM�u>�0Z]�&�{�W�/X)ϔ��9I �p�5��P�"D�C���._����������vsͭǕT���c�d� Դ�,dJ���+�T�`��SQ�k��(R�[@ofOX���HG*�<�y,�(�=�gܨ��:�%��7LpĤ��P@HH�iCV��%���m�q���2�8�W�0�t��Nic\<�}�'FJ�j��2��e죲��?]�>���v��\�/���- !�m�2��^0/���� ^`{#�}�G_p�|�	l\R�ƞ�Xd�	��k��>�-?2�4��s|��L��GZ�W���JF ��$��/D�:E���"`KT�R�e�����0F1cXǠ�a؆��04 b	`?H(,����{o�y��C3���F$C������ TD�DO�!��]rH�蠅f, o �k ���ӫ �4F��B������E�5L$ "�X ��
sڋ 4|a ,.���
0JYcFZ�p�C Al�{�@�����F��
�核�A+b()h�!�!R��6�d֒а� �.�1�V�����jT��`��������}=bq0M�1��������W�H|�����}>{�^p��W��)� pzA�4`x·�/S]	�t�q����Б�5�HݦH\b�D��>�38 ��O|' `y	��,�(-���kE��P�{��d=�H�9a�O�(RG/�%������"�<�E��A>���r��S���]�!f�> Ѥ����,m���/����o&m���[ͤ�jK9���Ӑ|ʬ3e�
2=��v�wVM�h�2Z�9"�@� �@�N�A�ӌ]�fn�rGF�r���߷.�Hʴ����-����K��K�T˳ۢ��Q�<p�D��kC�[���VI,�ȭZù�_�'�e�|(����b@�Ȣk���u����̉�H�?���������g����'�}nX�^� 0 �h�x)�T�8;�P,,��ոI��u��],2w�p��:�'D��`�w@�d.TSV
�S���o^@�!Yj$�Z�u1�MX@OA�Ҝ���7�a�N���ʉE�*���Qc1��g�������E��ȅ
P'A�0"�A�+�=� ;;	@T��o籥������)�8�԰`eB�7)`�x0��(�P/O򗟽-9�H�&q�p�W�u�C�
��dc� �1� �Ѐ�a�$!��,*"<e�!R�ǌ��V�� Q%����|�5�,��ݎ#��$}rӤ�|	��VAv�h[���P�
^%�;i@���NH�!f�g���K��ɚʗ5%��7i �N��f��l�T�3`�m�fffuv�H���8� �x{�����D7A���$���M�0@�!��lA@y$�!�3�H��i��C� �2;���{�0eRYI��L[e��Bf>�kZ�E� TZ��kIa��b.P����Ld�K�"H��ubgL�4�d�ābĂ,X�,L��pج��a{I���Y�*�fQS�b�8�8ԁ��u�f���������x����͓7�X�ξ��n538��2�}���ޓ���
����Bq��8ߙ��2���ݼ9��"��ړ
�!���K�w=��<�F@���Ro��@F1��&>�~ �s��Pё^D>$UdH�ET�f��7(�3�0]��B�B�A��F">���YQk�̎��rO_��P��h6'��(-Je��8����w�T2���D�x�.b��&�(g�z�d� F�g��uD�yp���
���y�Ѩs�p�8�c�r�
��X�=C�k@I$��mL�Xp�ނX���Q�]����V��ª�$�B^�T�
�!�7�p��{a�D;.g�cg�x��m�ڄ�ٱP����e���ϼ���&N@iL�&/��Į��A�Ŋ`ظ`��6�bt 5& �V1�Z� �������r�L�4tƮ��,������c���p���"C� p��0N�c�z��%-͞�����a�:S���D�Q{�ɘ�M����8w��L37D��_.� [�K:��'.BT����_�� �x�;q�h>0�2[Pq� �$c�*��/E�� �khJ��xAxA�5N�e�� �砬����6��p�莗t(��vm-透|s��BȀ~��S�����f�F�" F~b25o������n�{᝖W�2BPD�#-��3-j嘰��R�f_���:��Ծ�aO�k����4�!.�N��B�N�u�'#�<�s3�^�Ĺ�C��� ��U�6��7�xo�g�rq�q��� i回4� ��H_�:�$��b�_	��P	��x�:ze /�#�KHC 7���u*U����B� oi���9@�5�9ۇ�o���3�xi��T���|��3�`$�ēz�=�ņ���#��Ł�h��񍜊q X��6����g�F���u�7E��=���)�筱���.aNp�N�Q Ɂ�E;��?�&>=J�f��9�ͤ�k�s[͑���Ej�t��(�XD������9�y;��BY4���l"�]%�(�A-mq9����bb&Z�_�kƊ8.�ʼ��a�8�A\�Dܤ]���p�`/lQ�p�	A]�`o0Rv��2���4Y�$���5�֡�����yw�`>�U����d.�Ab(+ �NWU8�g[>yA�P{�� G�<L$11�R��!��H) �%��n,���>?H���H�x��dN�p��D
)��7�uA,�l*{���	&������e�����>����O��@�f����:nF�K
1vDQ�+p���&@J|k�\i�B�t�l����9j�}y~���s����6N3qTD�M��D�=$	����~"�O��JLT��Ċ|U���l>� ��R�������] �箟�-4��ߧ�Jyg������5�ާ�C����p��PD8�����((�!}��6'�l&&��6�2�
�93&�����7��x�����FG���4�m��K�a�k|��� P�(6���`8��x��?���k����5��6��@=��I!��!�� $�e�<���X�E>�C��:� �8�h9��U*������(!^H}�Đ�:8���6�U�� >�>�!e(�L�¨8P��\wޑ��)冓s��~�o�	s��@�C���>׃`������̏�4)�1�������
��JԌ �@��Y�3��/�=����2�����Q�Ӏ���!�@��������uR����[{��d���>����ԉ�(\�� ���~����s����� �&l��Og!�)���ۃиuq/@����Lq�6�+8��j����t^=�̧���m|��~�g��⸰p ��Y�%Fg���[F`�y�EҀ� j��8!�M0^ *a`�89��c��I�z��=�g�(����$`VN�]�¶��^7Ŭ��'�:�y=���>V������qM�ג1���(9��x��Ah�j�tj�;Zn��T�L��@>}��[�H��4>�\�y:�@=`�`pZ�B�Eۢ�"�9�J��<��kJYvG���C`>b@��n��()(er谏�ȵ���Mx ���^�B�}'�Z�B��3�+�f�/`	�mlX��$H�b�DDH��,�G;����*���t�4}̝�P�rt�����,,��Jdt��Q5���Iz���h�)���I#4,>K��;������-=&'MW�� (��;1ȼ�"c�x,PY9�an�
Y�J1F\�,�w��4������_(=�)nZH8�+"�m8A<�!��X��O��F��> 
���8�)�$��#oD_|���v/9~���I��6/<3�d:�{9��N� ����(��Y�p�H㥥�;4E6>qשiug� a�^(^�[�wu���h+��_LW8m���
�,D*"q�<��l�kh�6<NY�8�7�<F#��Fn/8�<����u[��o����c�5sD����o�A���(�L�aп0Hq��q~��@�D"ȄP�"� ~���!����*~<�����c��8� �B0�Q�DH�"w�J�T�A�0D@@�C<��N �p��O�pY�9�B^��a�(X�
��5A�jo.���Y��$Y�k��EyU d��@���L�
j�d/ Y1�i�R�d�F�$""�"�"M��	 �a ��G�n3[0���W>/�|��{~E�k��u� �"+��0��L���	��s=��>xx����3y��zD��.p�x��È�J�����6��q#�
4��˪I�S�q� y��9���룷��KJ�@C�{��<�"5j�p��@�'�dA�$�]*������˿�9���ĺ�"~�.0�!�}֧`5;->�`�2R.����S�V��P.
������W[��=��<���l��� z�j�Έv)�p!�G�H-�S��(��BS�k@1��̖� �Ӧg��&�����R�s=Ty�(t6(�ļ�j�G)�:šB1�?���U��EK�!	�ci�+a�t |�jւ��2����s���9���]��8P�������O�t�#�;����'0�8�dA�Bq����5�1	�	�5A(��#e8pA=h�m!!<�M'`��B�@A;�N��:}#�S���2�ͨ�����@@4�*��*qS`����b_�ÖŚ�-$Qj&.%Z��b�V��K.G�J���`α	A�[�D�_���\JLa3�@��:��UB85�2��2�CXb���3���K�|0�{�i]c��Q+��pb�D� u�B"Hgt��E�0
!��x�#� f�!?F���V҈�*@�o0�e��j�0-!���r!�
�"\��͹D��@cR���P��V �8�KCF[!�x.�0:�j���^<�P\��	&9���N�D�@�@�\Pg٘JR(v@�c�*#�<?k�bdK��u��y��NC�^��^T�P�Q�u�c=+-��*��9��]�L
L*��p	Ì��V�ČP��D�C揤!IA ����d(6�I��m�ŋI S�)���Uy�T�)@^�"��1SX��{�LU9�S�C
���T}�Z�"�"��9���p�QT�P,���K@¸�[Q���\��`�\���"� ��p��|��0�Մ!xv���C�u�`R��aX`�BJ�I�� f���um��@��(�l�u�m
�� �C�SH{MQFӌ���h)b�L�|�P����"����pP/	���`�A�%@H�e,������fgM�t��&�$(!����,�� %�(�^iu�P7 Z��E��( �6uX�4l:�8��Nȥ�h��[T�I��-�Z��Y`�]��wu*�(����`BsHP��J&cq �j,IШ����%�S0�-p
��h^G9!�Κ�B õ�z��	 EҮ,'tC`4ёA`��P���
H	�R�lj�QBU*�*@�-j$	e�d�	 PiIAQ-r%�%"LFR���(N�"�,E��,lKˋ N����w�T(����;�Q�$U� !��%��H&�]������͂ z����r��3����Hz
��sye�T�݈k����)bK��B��cv&8�R��0lG���e9k��r���S�H"�v��(Cpf�%� ㊄����CH{�03 k]Vj�$"��h�dH2$� ��?VX2�W`�XG�#�`H��H1�U2�
1�@;h��X���{ג�Gz �� �o8�ȧ7�(}*z�h������{"�M�MR��y��"� ��`~F���8��B�����hO� ����i˔@�`�F9(mP�>�|��(��nJ2��1H�<q��4���w����3H$�>HmB80h�9����a���d�"B`��*��H���I(jb�$Y���MA�����p���Cj'��M�<�
��$H$" H�Ϥ44�����&�:tY��<��!�!:�����*Ԯ�Z�4��" �;xM�&�$�I�t�S����j�xXAJ���1d���;��
�	��z���`9I`��B��D!��T��=w���į�6N�$Tv��@�ء��)�F�S5�m���ŸG�P�E(��B����.��ȅb:ø7o��DnS���Q�8�cX9�/hfhA҇��v�w��I�d�� DRǛ�
�Pg"�NP�%� �m.Xz��P ��S|�ωW!V%P�
A�C��"|JR	ӿ�h^� �Ҧ�P��΁�GQ��&�.(� ��Ȋ+zz�/�� �{'S
|)�C3�	�)))aJ�B���D0�CnFl�Ux�����a�� �v	v���A����t�`hV�by�@�{�SP�Ȁ9���k t�@R&
 ����_�o��N!>ȚZ�(�� ����3�<�S�ۚO:�N];^dN�v u�6��MIp��w��.��2v����@(D�)��co�F-���]G����n��0P�k�0�>�3`�@�#$�`B̀-���$HB� �	i$�����Tmaq׺��qqml-B��F�ҀZԭaP
7T�.��Z��\ ���ca-a�g8D�4���0��"�]�
h�0����z[���$�P��ƑϬ5E���$�j@���ۼ4')3ŝ .����J#�iY$. �Rh(/�M?���� xӀ��5иd~���5��
��$IE
��XB���҄@�
	"Ɯ+
�.x�D.����h6Z���`9L�%��J��Ff�xe(�jPvM �mJ �+AI�HFP�L�%�eo/K�T�-��a6M��P��T�8�rL�S:�(��i'�$h�xC!\��v AW��,	�t��C@� �]$K�a�
 ��ų\��bC��W#Ё��(H���X@�{�(/����&sI�P��`w��twr1����brW^��s/+�}L�gR�	s���'�Y�� ���!�+����覐�{@̃A·;��� P�H#9��W�<�O 5�Df�A�(���YT�3��� �NP��+'���>}v�h��٦�@��HX�D�:p�(l�� �����n&xd�Z�@E�,�+f �Z���h \��8��e��b�5�To13d�{6�d31S:tΙ'����C��5�v�K|pC�D��=�C��<��p��<��PL�	��<�H�1b���p�/��D�`<hfB�X����:8P�@���w�S��!����8�[� �a� �0[V)�Q^q�_4�qw֠�6;p���!h���"�͘�j���0F!#�\tA����4T."gF�v�%�ݱD3S5YeQG����G�Pj�D�(8Q%�Kd��b����Ac�����Lƍ )"1C�AL�p�P���(�cP����s
BH�\�3$�{�!&U�S}��'!�
D�u�D�s)�Uci	V�w�'��ʭ��� ;T�}���1Ø� �B�3�39���ɏ�t<PC1�D>�R[K4���`�A��@0D���5��#HЎ
�J�H���@3���8 "^�� �S���{�����~��u��+���hr��S>>\�!Ć+�6��� ���n-����������4<'���E/S�>�/�}b�d�1FYO-�:
�
C���L�@�	�kx��QC��H���s��V���v��� N��J%D�w�aH��b\�8¯	w؎'HGk���fg[�o;�S°�|�&%�I٬A눙!����5Y,rg��.cQXX,-1
��ִR"PM�sC^@㑆5�f�ì��@*� H�dI8�WO�	�<�v�C��(�!Z.��y.��}�z?Y�7���M��}#��Pu�ԧ(hS��s=E�$���Z��	p� ��EX1DY�4�@5�Qw�t0���?I�K��|9�T��p>XHI7�d�a44Sk�Z��ɱ<�!qIB}��m���3g��K�Ȑ�h�8��@�*LŬRXE���@�.b,�c9��X�1L��T!���A�*�F�@� �X6�UM�-A���rm�r(yp0��s�	�YV�*�����8�,�`���Pe��9�I
7��@������.����b�
�AJ�5�]V��vA��]�&�� �"�؈f�VU�Qs��Q�5�J,����l�˔3 �C�KF��N��K���E9*	�v����C�pu�6���u����L���A��^GM�X�'����j�Xlt]�X�\M�K`^ ��`d��Yn���B�D��9��C[��#2" t ��Y�%"�%��s�dd�4��8Т��!JZ��/� x[�Y�8�2�0���eބ�"$��'t jcB{D����������-���&%�s��O:�{����!c�?m�m�9U`HB� r%�#ش^_�D�S�]^wyh��@ ̔8R�A��`����Z
 D%�Ё��B�����taa`��Մ�Qov�9�|�@������zr� ����@с�ň���,䰬��L(@1�0��)��(H�A��ֺ	�]�������^����/3�`�!T�F�����L!P��,Nn�$G���>)(�4��������1ߛ�VN�V�ޤ�:Q�T�M�T��(����A�1I }�+��8Dy��`�!�v�f�dd��]RH&��F�,��PKX��4<a��T":U���+q��o��tS������AT�Z��A�c�O��`P,AG2T.sLq-	q#���'Ϥ��.��;=�LQt��WHw�"�Q���ͳ7��c<a�@$���ʓ�CA&���J�E�	� ���d ^�.��$BB�$�{"��V�T��\'yO��'�[�,~q�w:_��U���ȠH:@�.�M71�HI�@����H�k��-A"��?�rT��ѫB�f�ha�IA$bY	�iM��%�S-�>{�0{@�; �1�b� 9�oԠ�`� hO#GSҧ8�q*0|D�Spkx�s����s�D֐ܦ���S�`�P���UA��)0E�!Br�;g��KY����J8�^� z��#!ևs�W&�X�mZFP��5��&ow���"j��9@Q�׬���^I�x�p p���	��������T,bVǀ�f�A�2�� ��+�O�� ~�B �"R'�(�(`�$<��<�G���@�a�C�~W:e�ҠY,RP��BĦ03A.*1O��_�hX*ҧ� '�.b	!��?�@X��y���M mj1B[�_k��.Ar��������j �`�)�2(���
0N
Nk��*�8�MB��a�B�r���H��Kl��*r��Ϩ�Uʢm��!b�U�~⅖Z�O�iy�`T`�Tr�H dT@K�mO��@�5�`��I`�>#!�������H���
��bC`��V���p 0W"!Q;s��������"��)��������G��p"@s�֩!�n(,D���Z��sT�4�wȉǂ b�@l����:���0��*@,$h�<H���eC
uto #�
E[���?���A���9�,jW�
]�޻�0��쟲� �-axRJ�iclB����>�aH�]�:.DLM���"�o�>��3ˡ\�����IkU,W����  �A �]jþ��`X�'�Ω��V�U�!�yr�#̅��l��0���P��%3����"��`\	���`\)�����B&�I "4�P��B"|ͯ�u�B8���<������:C��L}&��<JP���۔C�C�Ž�#yj�qO�E�iA�2�̪��a
"�LH`�w c�_��,D���c��ԁ���xb6'�QK/iU�0E�����Q bfEuӪ����ȿ�Fj=!�m��2��(�t^f����Cj2��I`�$Bx�7H;��^vi��(0�R����2�2��5Ƿ��S+�<^�%4�8�*���Q8������,X�VT�>D4�=���T�X
F�5jT}#n�&��� hCR�\Gwb��)��Vy�֍�e+d��9�s�<)JE��/)}`J!@v�c/S�07�y�E�#�M�*�ޘ⥊��y�-��K�I���_I�f�@���@!���BB��!�(0*7qfd�{}����*o�D�rx�\�.�'
�]�g'3�(_��ւ얄����.q���^*w�_E¥JN(��M�S.�JܑeZZ	p�$B �Mig�?��� &�@:�C(?��-H�X��"wo��>p��Dʁ��S-�/�aul��D�`��4U��
�?0'��'1�A��xr��  �Z(	��y�-Ѕ�I1CzK�B4\�J�d��j"��mKT!Ƨ	�w \Ȳ	q#@NcA_S┤������1�`�m����`�0b� �
1_������F5�ޅ�B�э�Z�F����[���7?������[���}��2�f���M�G�m��8�����Y�t:Gc��O��o+΁�O[���槓��-�?��)c���,;S���^�4�� tk����f䁈+PX��
`�*z�}F1Uu�2
ҽj&EQ��E�-�L�t��C`�v�Fh����bjдiR�k�Q+�32fI�D9�ǅ2�to��u��Y��3Hwy��%م/�L &P&�H=ؖZ�>�|@����g֤j����DM�`�8��	]d#'<<���i��
���jPҚ�)��'�힂c���u{��
[��ǙF���/C��*��*�*��穜�K�nVΦy�����=ہ`A^�Qܨ ��``U����J�+t��_�i_�7̡w�l�mT�)�D�5v4�Lن�<`E�U��bU�!n�&�9�3�����p���bq�;�_愒FF�AS��._�=�01�(�J���pV����56��&��m�N��m	o�*�Dj�4� f����n8���ɶ��cQ�����v���ݐ�#�O=p�6�h�?b��ӏssDǫ�8�z%qde����N�
�IW`�["
a�4���|xͧr��ܡ�7�vM��_4�^vb�`۹���2�aW���Ih:�d�(P�$���u�{&�l����z�9t{�������tS�R��y�u�ݳe$�F�dE��g.�_[Y�ṯ%cpJ�p�a���9���\b�$�=�By�Q����9FE5��%�T�,���Y")�k2+h�3�'��'O��,.�qYƼ[V�<�
�\�1�o7`)3!�e]��#�po�+��:}�!���/[�FZ����@�V�� �l����$��NQX9��RU����
��V(�EU"�
��^/��� GY FK��4-	����f$r�>��� Pw�'�7�.��]�����<��@�R��	���t�lh�O���CQ��3��|�Y,U�����N/@�o�@D��C�T��kň����9�W������A$c�����W �{��v�?\9;$���#��ΪCZ�oK����0�-=�F��\�e�-��l�H��bp��N-��]]"iTL��e`c�Y�I닢K~���=�1m�ak{]�a& �cf�Ad�IYv�<��\b� []�].�r�P�t�;�}�`fd�Χ��C��åa�uV�2
��Ċ~�2���h��S'j�/�p���������ɉ�`x>����*U~ �A�l��!	�4���<��֧�Fz��(���	\ȏ ����hr��`t�ywf�1����M�˝�t�h����Vq��T���e%�I���ʪy+1��hعOa-p]�T�WJN���dq���V�D!�~�q<�)�?�/}뤉W�<����B���5���B�:j��e�ҧ��5�|��:���w��<?9`�zG��
R2��D���=c}Z���%���,�`��g37m�Z@9j���Q�U�b]1��v��bp�T�^���'���4�j
��T��� 3�����ǧ��r�!�q��L�[�i���@��yW�<ZSf��ǰ�k��C_�/r�\�^�e����84�%$u�ٱ=�,IV=�*{�VP���r��ԸY2JD�ի�fq�7�c�ԉ+^;�mI�:�6>�D�����;�Y	,%��KAI���{���Ա�!:6�c��ܑN$%���