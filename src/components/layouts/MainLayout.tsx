import { Header } from './Header';

interface MainLayoutProps {
  children: React.ReactNode;
}

export function MainLayout({ children }: MainLayoutProps) {
  return (
    <div className="min-h-screen flex flex-col">
      <Header />
      <main className="flex-1 container py-6">
        {children}
      </main>
      <footer className="border-t border-border py-6 text-center text-sm text-muted-foreground">
        <p>© 2026 Learning Companion. Empowering first-generation students.</p>
      </footer>
    </div>
  );
}
