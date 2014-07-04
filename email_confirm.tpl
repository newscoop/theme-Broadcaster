{{ config_load file="strings-{{ $gimme->language->code }}.tpl" }}
{{ #mailHello# }}

{{ #mailAutomaticalMessage# }} {{ $gimme->publication->name }} ({{ $gimme->publication->site }})

{{ #mailPleaseConfirm# }}

http://{{ $publication }}{{ $view->url(['user' => $user, 'token' => $token], 'confirm-email') }}

{{ #mailOtherwise# }}

{{ #mailThanks# }}

{{ $view->placeholder('subject')->set(sprintf("E-mail confirmation at %s", $site)) }}
