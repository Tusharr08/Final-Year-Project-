import Image from 'next/image'
import { Inter } from '@next/font/google'
import styles from './page.module.css'

const inter = Inter({ subsets: ['latin'] })

export default function Home() {
  return (

      <div>
        <header>
          <h1 className='text-3xl font-bold '>Blockchain Charity Platform</h1>
          <p>Empowering charitable giving through transparency and trust.</p>
        </header>
    
        <main>
          <section>
            <h2 className='text-3xl font-bold underline'>How it works</h2>
            <p>
              Our platform uses blockchain technology to ensure that your charitable
              donations go directly to the intended recipients, with no intermediaries
              taking a cut.
            </p>
            <p>
              All transactions are transparent and verifiable on the blockchain, allowing
              you to see exactly where your money is going.
            </p>
          </section>
    
          <section>
            <h2 className='text-3xl font-bold underline'>Get involved</h2>
            <p>
              You can start making a difference today by making a donation through our
              platform. Simply sign up for an account and start browsing our list of
              vetted charities.
            </p>
            <p>
              Additionally, if you're a charity in need of funding, you can apply to be
              listed on our platform.
            </p>
          </section>
        </main>
    
        
      </div>

    
  )
}
