

class vim {

    case $operatingsystem {
        'Debian': { 
                    $pkgvim = "vim"
                    $vimrcpath = "/etc/vimrc"
                    $vimcolorpath = "/usr/share/vim/vimcurrent/colors/denseh.vim"
                  }
        default: { 
                    $pkgvim = "vim"
                    $vimrcpath = "/etc/vimrc"
                    $vimcolorpath = "/usr/share/vim/vimcurrent/colors/denseh.vim"
                 }
    }

    package { $pkgvim:
        ensure => installed,
    }
    
    file { $vimrcpath:
        source => "puppet:///modules/vim/vimrc",
        user   => root,
        group  => root,
        require => Package[$pkgvim],
    }

    file { $vimcolorpath:
        source => "puppet:///modules/vim/colors-denseh",
        user    => root,
        group   => root,
        require => Package[$pkgvim],
    }
    
}
