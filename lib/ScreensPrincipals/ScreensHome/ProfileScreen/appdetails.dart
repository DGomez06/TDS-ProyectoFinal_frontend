import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AppDetails extends StatefulWidget {
  const AppDetails({super.key});

  @override
  AppDetailsState createState() => AppDetailsState();
}

class AppDetailsState extends State<AppDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 40),
          Padding(
            padding: const EdgeInsets.only(left: 30),
            child: SvgPicture.asset(
              'assets/icons/ProfileScreen/back.svg',
              height: 25,
              alignment: Alignment.topRight,
            ),
          ),
          const SizedBox(
            height: 15.0,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Row(
              children: [
                SvgPicture.asset('assets/icons/ProfileScreen/barsfill.svg'),
                const SizedBox(
                  width: 10.0,
                ),
                const Text('Detalles de la app',
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 25.0)),
              ],
            ),
          ),
          const Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ListTile(
                      title: Text(
                        'Politica de Privacidad ',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 18),
                      ),
                    ),
                    Text(
                      'Política de Privacidad para la Aplicación de Gestión de Alquileres',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      'Introducción',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      'El equipo de desarrollo de la aplicación (en adelante, el "Desarrollador") está comprometido a proteger la privacidad de los usuarios de la aplicación de gestión de alquileres (en adelante, la "Aplicación"). Esta Política de Privacidad (en adelante, la "Política") describe cómo el Desarrollador recopila, utiliza y procesa los datos personales de los usuarios.',
                      textAlign: TextAlign.justify,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      'Recopilación de Datos Personales',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      'El Desarrollador recopila datos personales de los usuarios cuando estos utilizan la Aplicación, incluyendo:',
                      textAlign: TextAlign.justify,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      '-Información de registro: Cuando un usuario se registra en la Aplicación, el Desarrollador recopila su nombre, dirección de correo electrónico y contraseña.',
                      textAlign: TextAlign.justify,
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      '-Información de perfil: El Usuario puede proporcionar información adicional sobre su perfil, como su número de teléfono, dirección y foto.',
                      textAlign: TextAlign.justify,
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      '-Información de la propiedad: El Usuario puede proporcionar información sobre sus propiedades de alquiler, como la ubicación, el tamaño, las características y las imágenes.',
                      textAlign: TextAlign.justify,
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      '-Información de pago: El Usuario puede proporcionar información de pago para realizar pagos a través de la Aplicación.',
                      textAlign: TextAlign.justify,
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      '-Información de comunicación: El Desarrollador puede recopilar información sobre las comunicaciones del Usuario con otros usuarios a través de la Aplicación.',
                      textAlign: TextAlign.justify,
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      '-Datos de uso: El Desarrollador puede recopilar datos sobre cómo el Usuario utiliza la Aplicación, como las páginas que visita, las funciones que utiliza y el tiempo que pasa en la Aplicación.',
                      textAlign: TextAlign.justify,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      'Uso de Datos Personales',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      'El Desarrollador utiliza los datos personales de los usuarios para:',
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      '-Proporcionar y mejorar la Aplicación.',
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      '-Procesar pagos.',
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      '-Comunicarse con los usuarios.',
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      '-Enviar notificaciones y alertas.',
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      '-Prevenir el fraude y el abuso.',
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      '-Cumplir con la ley.',
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      'Compartir Datos Personales',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      'El Desarrollador no compartirá los datos personales de los usuarios con terceros sin el consentimiento previo del usuario, excepto en los siguientes casos:',
                      textAlign: TextAlign.justify,
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      '-Cuando sea necesario para cumplir con la ley o una orden judicial.',
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      '-Cuando sea necesario para proteger los derechos o la propiedad del Desarrollador o de terceros.',
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      '-Cuando el Usuario haya dado su consentimiento para compartir sus datos personales con terceros.',
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      'Seguridad de los Datos Personales',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      'El Desarrollador toma medidas de seguridad razonables para proteger los datos personales de los usuarios contra la pérdida, el robo, el uso indebido, el acceso no autorizado, la divulgación, la alteración o la destrucción.',
                      textAlign: TextAlign.justify,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      'Retención de Datos Personales',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      'El Desarrollador retendrá los datos personales de los usuarios durante el tiempo que sea necesario para cumplir con los propósitos para los que fueron recopilados, a menos que la ley exija un período de retención más largo.',
                      textAlign: TextAlign.justify,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      'Derechos de los Usuarios',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      'Los usuarios tienen los siguientes derechos en relación con sus datos personales:',
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      '-Derecho de acceso.',
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      '-Derecho de rectificación.',
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      '- Derecho de supresión.',
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      '- Derecho de limitación del tratamiento.',
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      '- Derecho de oposición al tratamiento.',
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      '- Derecho a la portabilidad de los datos.',
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      'Cambios a la Política',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      'El Desarrollador podrá modificar esta Política en cualquier momento. El Usuario será notificado de cualquier modificación a la Política mediante la publicación de la Política modificada en la Aplicación o a través de correo electrónico.',
                      textAlign: TextAlign.justify,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      'Contacto',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      'Si tiene alguna pregunta sobre esta Política, puede contactarnos  a 20212216@itla.edu.do, 20212162@itla.edu.do.',
                      textAlign: TextAlign.start,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      'Disposiciones Finales',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      'Esta Política constituye el acuerdo completo entre el Usuario y el Desarrollador en relación con el tratamiento de los datos personales de los usuarios. Si alguna disposición de esta Política se considera inválida o inaplicable, dicha disposición será separada de esta Política y las disposiciones restantes permanecerán en pleno vigor y efecto.',
                      textAlign: TextAlign.justify,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      'Términos y Condiciones para la Aplicación de Gestión de Alquileres',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      'Los presentes Términos y Condiciones (en adelante, los "Términos") regulan el uso de la aplicación de gestión de alquileres (en adelante, la "Aplicación") desarrollada por el equipo de desarrollo de la aplicación (en adelante, el "Desarrollador"). La Aplicación tiene como objetivo facilitar la administración de propiedades de alquiler para propietarios y arrendatarios.',
                      textAlign: TextAlign.justify,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      'Aceptación de los Términos',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      'Al descargar, instalar o utilizar la Aplicación, usted (en adelante, el "Usuario") acepta y se compromete a cumplir con todos los Términos. Si no está de acuerdo con estos Términos, no debe utilizar la Aplicación.',
                      textAlign: TextAlign.justify,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      'Registro y Cuenta de Usuario',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      'Para utilizar algunas funciones de la Aplicación, el Usuario deberá crear una cuenta (en adelante, la "Cuenta"). El Usuario es responsable de mantener la confidencialidad de la información de su Cuenta y de toda la actividad que ocurra en ella. El Usuario no podrá utilizar la Cuenta de otra persona sin su consentimiento.',
                      textAlign: TextAlign.justify,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      'Funcionalidades de la Aplicación',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      'La Aplicación ofrece diversas funcionalidades, incluyendo:',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      '-Gestión de propiedades:  El Usuario podrá crear perfiles para cada propiedad, incluyendo información como la ubicación, el tamaño, las características y las imágenes.',
                      textAlign: TextAlign.justify,
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      '-Seguimiento de contratos: El Usuario podrá cargar contratos de alquiler, establecer fechas de vencimiento y recibir notificaciones cuando se acerquen.',
                      textAlign: TextAlign.justify,
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      '-Pagos de alquiler:  El Usuario podrá recibir pagos de alquiler de forma electrónica a través de la Aplicación.',
                      textAlign: TextAlign.justify,
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      '-Comunicación propietario-arrendatario:  El Usuario podrá comunicarse con sus arrendatarios directamente a través de la Aplicación.',
                      textAlign: TextAlign.justify,
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      '-Gestión de mantenimientos: El Usuario podrá crear solicitudes de mantenimiento, asignarlas a técnicos y recibir notificaciones sobre el estado del trabajo.',
                      textAlign: TextAlign.justify,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      'Tarifas y Pagos',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      'El uso de la Aplicación puede estar sujeto a tarifas. El Desarrollador informará al Usuario de las tarifas aplicables antes de que este realice cualquier compra. El Usuario podrá realizar pagos a través de la Aplicación utilizando un método de pago válido.',
                      textAlign: TextAlign.justify,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      'Propiedad Intelectual',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      'La Aplicación y todo su contenido, incluyendo, entre otros, el código fuente, los diseños, las imágenes y los textos, son propiedad intelectual del Desarrollador o de sus licenciantes. El Usuario no podrá copiar, modificar, distribuir o utilizar de ninguna manera el contenido de la Aplicación sin el consentimiento previo y por escrito del Desarrollador.',
                      textAlign: TextAlign.justify,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      'Responsabilidad del Usuario',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      'El Usuario es responsable del uso que haga de la Aplicación. El Usuario no podrá utilizar la Aplicación para ningún propósito ilegal o que pueda dañar a otros. El Usuario no podrá cargar a la Aplicación ningún virus, malware u otro contenido dañino.',
                      textAlign: TextAlign.justify,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      'Limitación de Responsabilidad',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      'El Desarrollador no se hace responsable de ningún daño directo, indirecto, incidental, especial o consecuente que surja del uso o la imposibilidad de usar la Aplicación. El Desarrollador no garantiza que la Aplicación esté libre de errores o interrupciones.',
                      textAlign: TextAlign.justify,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      'Terminación',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      'El Desarrollador podrá suspender o cancelar la Cuenta del Usuario en cualquier momento, sin previo aviso, si considera que el Usuario ha violado estos Términos.',
                      textAlign: TextAlign.justify,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      'Modificaciones a los Términos',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      'El Desarrollador podrá modificar estos Términos en cualquier momento. El Usuario será notificado de cualquier modificación a los Términos mediante la publicación de los Términos modificados en la Aplicación o a través de correo electrónico.',
                      textAlign: TextAlign.justify,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      'Legislación Aplicable y Jurisdicción',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      'Estos Términos se regirán e interpretarán de conformidad con las leyes de la República Dominicana. Cualquier disputa que surja de estos Términos será sometida a la jurisdicción exclusiva de los tribunales de la República Dominicana.',
                      textAlign: TextAlign.justify,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      'Contacto',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      'Si tiene alguna pregunta sobre estos Términos, puede contactarnos a 20212216@itla.edu.do, 20212162@itla.edu.do.',
                      textAlign: TextAlign.start,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      'Consentimiento para el Tratamiento de Datos Personales',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      'Al utilizar la Aplicación, el Usuario acepta que el Desarrollador recopile, use y procese sus datos personales de conformidad con la Política de Privacidad.',
                      textAlign: TextAlign.justify,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      'Disposiciones Finales',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      'Estos Términos constituyen el acuerdo completo entre el Usuario y el Desarrollador en relación con el uso de la Aplicación. Si alguna disposición de estos Términos se considera inválida o inaplicable, dicha disposición será separada de estos Términos y las disposiciones restantes permanecerán en pleno vigor y efecto.',
                      textAlign: TextAlign.justify,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
