node default {

    $url_1 = "http://web.dom.tld/path"
    $url_1_without_trailing_slash = without_trailing_slash( $url_1 )

    $url_2 = "http://web.dom.tld/path/"
    $url_2_without_trailing_slash = without_trailing_slash( $url_2 )

    notice( "url_1_without_trailing_slash:  $url_1_without_trailing_slash" )
    notice( "url_2_without_trailing_slash:  $url_2_without_trailing_slash" )
}
