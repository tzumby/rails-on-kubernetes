podTemplate(label: 'pod-golang', 
    containers: [
        containerTemplate(
            name: 'golang',
            image: 'golang',
            ttyEnabled: true,
            command: 'cat'
        )
    ]
) {
    node ('pod-golang') {

        stage 'Build'
        container('golang') {

          sh ("go version")

        }
    }
}
