{{ $gimme->article->intro }}

{{ assign var=numbers value=[
                    1 => 'one',
                    2 => 'two',
                    3 => 'three',
                    4 => 'four',
                    5 => 'five',
                    6 => 'six',
                    7 => 'seven',
                    8 => 'eight',
                    9 => 'nine',
                    10 => 'ten',
                    11 => 'eleven',
                    12 => 'twelve',
                    13 => 'thirteen',
                    14 => 'fourteen',
                    15 => 'fifteen',
                    16 => 'sixteen',
                    17 => 'seventeen',
                    18 => 'eighteen',
                    19 => 'nineteen',
                    20 => 'twenty',
                    21 => 'twentyone',
                    22 => 'twentytwo',
                    23 => 'twentythree',
                    24 => 'twentyfour',
                    25 => 'twentyfive',
                    26 => 'twentysix',
                    27 => 'twentyseven',
                    28 => 'twentyeight',
                    29 => 'twentynine',
                    30 => 'thirty'
                  ]
                }}
                {{ assign var=int value=1 }}

<p>* = Canadian artist<br />
^ = Torontonian artist</p>

<table class="widget widget now-playing-list"><colgroup> <col style="text-align: center;" width="30"> <col width="350"> <col width="240"> <col width="240"> </colgroup>
  <thead>
    <tr>
      <td style="text-align: center;">#</td>
      <td>ARTIST</td>
      <td>ALBUM</td>
      <td class="label_col">LABEL</td>
    </tr>
  </thead>
  <tfoot>
    <tr>
      <td>&nbsp;</td>
    </tr>
  </tfoot>
  <tbody>
  {{ while $int <= 30 }}
  {{ $artist = '_artist' }}
  {{ $album = '_album' }}
  {{ $label = '_label' }}
  {{ $can = '_canadian' }}
  {{ $tor = '_torontonian' }}
    <tr>
      <td {{ if $int <= 3 }}class="{{ if $int == 1 }}first_place{{ else if $int == 2 }}second_place{{ else if $int == 3 }}third_place{{ /if }}"{{ /if }}>{{ $int }}</td>
      <td>
      {{ $var = $numbers[$int]|cat:$artist }}
        <h4>
          {{ $gimme->article->$var }}
          {{ $isCan = $numbers[$int]|cat:$can }}
          {{ $isTor = $numbers[$int]|cat:$tor }}
          {{ if $gimme->article->$isCan }}
          *
          {{ else if $gimme->article->$isTor }}
          ^
          {{ /if }}
        </h4>
      </td>
      {{ $var = $numbers[$int]|cat:$album }}
      <td>{{ $gimme->article->$var }}</td>
      {{ $var = $numbers[$int]|cat:$label }}
      <td class="label_col">{{ $gimme->article->$var }}</td>
    </tr>
  {{ $int = $int + 1 }}
  {{ /while }}
  </tbody>
</table>