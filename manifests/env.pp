# Creates an environment with Anaconda, Python, and Numpy
# To add packages see anaconda::package

define anaconda::env( $anaconda_version='5.0.1', $numpy='1.13.3', $python='3.6',
                    $base_path='/opt/anaconda') {
    include anaconda

    $conda = "${base_path}/bin/conda"

    exec { "anaconda_env_${name}":
        command => "$conda create --yes --quiet \
                    --name=${name} anaconda=${anaconda_version} numpy=${numpy} \
                    python=${python}",
        creates => "${base_path}/envs/${name}",
        require => Class["anaconda::install"],
    }
}
