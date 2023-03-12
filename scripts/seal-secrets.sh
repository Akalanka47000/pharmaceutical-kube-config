for folder in "./services"/*/
do
    folder=${folder%*/}
    cat $folder/secrets.yml | kubeseal --format yaml --controller-namespace kube-system --controller-name sealed-secrets > $folder/sealed-secrets.yml
    echo "Sealed $(basename "$folder") secrets successfully"
done