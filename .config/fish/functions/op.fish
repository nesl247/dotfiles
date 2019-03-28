function __get_code_directories
    set desc (_ "Project")
    set -l tmpFile /tmp/fish-op-cache
    set -l array dirs

    if test -f $tmpFile
        read -a dirs <$tmpFile
    else
        for dir in ~/code/* ~/code/linio/*
            set -l dirName (basename $dir)

            if test $dirName = 'linio'
                continue
            end

            if test -d $dir
                set -a dirs $dirName
            end
        end

        echo $dirs >$tmpFile
    end

    printf "%s\t$desc\n" $dirs
end

function op --description "Open a project"
    set -l edit false
    set -l tower false
    set -l project
    set -l tmpFile /tmp/fish-op-cache

    for option in $argv
        switch "$option"
            case -t --tower
                set tower true
            case -e --foo
                set edit true
            case \*
                if test -d ~/code/$option
                    set project $option
                else if test -d ~/code/linio/$option
                    set project linio/$option
                else
                    printf "error: Unknown option %s\n" $option
                    return 1
                end
        end
    end

    read -a dirs <$tmpFile

    if set -l index (contains -i -- $option $dirs)
        set -e dirs[$index]
        set -p dirs $option
    end

    echo $dirs >$tmpFile

    cd ~/code/$project

    if eval $tower
        open -g ~/code/$project -a /Applications/Tower.app
    end

    if eval $edit
        code .
    end
end
