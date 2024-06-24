# You need to found the ID of your mouse with: `xinput`
# Then, found the value for the Coordinate Transformation Matrix
# with: xinput list-props <id> | grep Matrix
# xinput --set-prop <id> <value> <velocity> 0 0 0 <velocity> 0 0 0 1
#
# xinput list-props <id> | grep "libinput Accel Profile Enabled"
# libinput Accel Profile Enabled (XXX): 1, 0
# xinput --set-prop <id> <XXX> 0 1

velocity=""
mouse_id="14"
transformation_matrix_id="157"

optstring=":v:"
while getopts ${optstring} flag; do
    case "${flag}" in
    v) 
        velocity=${OPTARG} 
        ;;
    ?) 
        echo "invalid option: -${OPTARG}."
        exit 1 
        ;;
    esac
done

shift "$(( OPTIND - 1 ))"

if [ -z "$velocity" ]; then
   echo "Missing argument"
   echo "Usage $0 -v [velocity]" >&2
   exit 1
fi

xinput --set-prop "$mouse_id" "$transformation_matrix_id" "$velocity" 0 0 0 "$velocity" 0 0 0 1
echo "Velocity set to: $velocity"




