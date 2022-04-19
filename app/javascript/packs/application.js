import Rails from '@rails/ujs'
import Turbolinks from 'turbolinks'
import * as ActiveStorage from '@rails/activestorage'
import 'channels'
import 'bootstrap/dist/js/bootstrap.bundle'

import '../src/application.css'

Rails.start()
Turbolinks.start()
ActiveStorage.start()
