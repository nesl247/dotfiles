function __get_code_directories
    set desc (_ "Project")

    set -l array dirs

    for dir in ~/code/*
        if test -d $dir
            set -a dirs (basename $dir)
        end
    end

    if set -q dirs[1]
        printf "%s\t$desc\n" $dirs
    end
end

function op --description "Open a project"
    set -l edit false
    set -l project

    for option in $argv
        switch "$option"
            case -e --foo
                set edit true
            case \*
                if test -d ~/code/$option
                    set project $option
                else
                    printf "error: Unknown option %s\n" $option
                end
        end
    end

    cd ~/code/$project
    open -g ~/code/$project -a /Applications/Tower.app

    if eval $edit
        code .
    end
end
